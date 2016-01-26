//
//  GetWeatherData.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "GetWeatherData.h"
#import "CurrentConditions.h"
#import "CurrentWeatherData.h"
#import "V_3_X_Networking.h"

static NSString *appIdKey = @"8781e4ef1c73ff20a180d3d7a42a8c04";

typedef enum : NSUInteger {
    kWeather = 0x11,
    kDaily,
}EGetWeatherDataValue;

@interface GetWeatherData ()<NetworkingDelegate>

@property (nonatomic, strong) CurrentConditions  *currentConditions;
@property (nonatomic, strong) CurrentWeatherData *currentWeatherData;

@property (nonatomic, strong) Networking         *networkWeather;
@property (nonatomic, strong) Networking         *networkDaily;

@end

@implementation GetWeatherData

- (void)startGetLocationWeatherData {
    if (self.location == nil) {
        return;
    }
    NSString *latStr = [NSString stringWithFormat:@"%f", self.location.coordinate.latitude];
    NSString *lonStr = [NSString stringWithFormat:@"%f", self.location.coordinate.longitude];
    self.networkWeather =
    [V_3_X_Networking getMethodNetworkingWithUrlString:@"http://api.openweathermap.org/data/2.5/weather"
                                     requestDictionary:@{@"lat"   : latStr,
                                                         @"lon"   : lonStr,
                                                         @"APPID" : appIdKey}
                                       requestBodyType:[HttpBodyType type]
                                      responseDataType:[JsonDataType type]];
    self.networkWeather.tag      = kWeather;
    self.networkWeather.delegate = self;
    self.networkWeather.timeoutInterval = @(5.f);
    [self.networkWeather startRequest];
    
    //  请求2
    self.networkDaily =
    [V_3_X_Networking getMethodNetworkingWithUrlString:@"http://api.openweathermap.org/data/2.5/forecast/daily"
                                     requestDictionary:nil
                                       requestBodyType:[HttpBodyType type]
                                      responseDataType:[JsonDataType type]];
    self.networkDaily.tag             = kDaily;
    self.networkDaily.delegate        = self;
    self.networkDaily.timeoutInterval = @(8.f);
    
}

- (void)requestSucess:(Networking *)networking data:(id)data {
    if (networking.tag == kWeather) {
        // 请求1结果
        NSLog(@"城市1 ： %@", data);
        CurrentWeatherData *currentData = [[CurrentWeatherData alloc] initWithDictionary:data];
        if (currentData.cod.integerValue == 200) {
            
            self.currentWeatherData             = currentData;
            self.networkDaily.requestDictionary = @{@"id"    : self.currentWeatherData.cityId,
                                                    @"cnt"   : @"14",
                                                    @"APPID" : appIdKey};
            [self.networkDaily startRequest];
        } else {
            
            [_delegate weatherData:nil success:NO];
        }

    }else if (networking.tag == kDaily) {
        
        // 请求2结果
        NSLog(@"城市2 ： %@", data);
        CurrentConditions *currentData = [[CurrentConditions alloc] initWithDictionary:data];
        if (currentData.cod.integerValue == 200) {
            
            self.currentConditions = currentData;
            [_delegate weatherData:@{@"WeatherData"       : self.currentWeatherData,
                                     @"WeatherConditions" : self.currentConditions}
                            success:YES];
        } else {
            
            [_delegate weatherData:nil success:NO];
        }
    }

}

- (void)requestFailed:(Networking *)networking error:(NSError *)error {
    [_delegate weatherData:nil success:NO];
}

@end
