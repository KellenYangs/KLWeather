//
//  GetWeatherData.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol GetWeatherDataDelegate <NSObject>

- (void)weatherData:(id)object success:(BOOL)sucess;

@end

@interface GetWeatherData : NSObject
@property (nonatomic, weak) id<GetWeatherDataDelegate> delegate;

/**
 *  地址信息
 */
@property (nonatomic, strong) CLLocation  *location;


/**
 *  城市ID号码
 */
@property (nonatomic, strong) NSString    *cityId;


/**
 *  开始获取网络数据 (开始获取定位数据的信息)
 */
- (void)startGetLocationWeatherData;

@end
