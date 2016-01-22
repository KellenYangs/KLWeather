//
//  CurrentWeatherData.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "CurrentWeatherData.h"

@implementation CurrentWeatherData

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if([key isEqualToString:@"id"]) {
        self.cityId = value;
    }
    [super setValue:value forUndefinedKey:key];
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNull class]]) {
        return;
    }
    
    if ([key isEqualToString:@"coord"]) {
        value = [[Coord alloc] initWithDictionary:value];
    }
    
    if ([key isEqualToString:@"sys"]) {
        value = [[Sys alloc] initWithDictionary:value];
    }
    
    if ([key isEqualToString:@"main"]) {
        value = [[MainInfo alloc] initWithDictionary:value];
    }
    
    if ([key isEqualToString:@"wind"]) {
        value = [[Wind alloc] initWithDictionary:value];
    }
    
    if ([key isEqualToString:@"clouds"]) {
        value = [[Clouds alloc] initWithDictionary:value];
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
