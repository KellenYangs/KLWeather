//
//  WeatherInfo.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "WeatherInfo.h"

@implementation WeatherInfo

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNull class]]) {
        return;
    }
    
    if ([key isEqualToString:@"temp"]) {
        value = [[Temp alloc] initWithDictionary:value];
    }
    
    if ([key isEqualToString:@"weather"] && [value isKindOfClass:[NSArray class]]) {
        NSArray *tmp = value;
        NSMutableArray *weatherList = [NSMutableArray array];
        
        for (NSDictionary *data in tmp) {
            Weather *weather = [[Weather alloc] initWithDictionary:data];
            [weatherList addObject:weather];
        }
        
        value = weatherList;
    }
    
    [super setValue:value forKey:key];
}


@end
