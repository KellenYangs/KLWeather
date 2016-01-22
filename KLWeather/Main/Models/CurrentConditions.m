//
//  CurrentConditions.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "CurrentConditions.h"

@implementation CurrentConditions

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([value isKindOfClass:[NSNull class]]) {
        return;
    }
    if ([key isEqualToString:@"city"]) {
        value = [[City alloc] initWithDictionary:value];
    }
    if ([key isEqualToString:@"list"] && [value isKindOfClass:[NSArray class]]) {
        NSArray *tmp                    = value;
        NSMutableArray *weatherInfoList = [NSMutableArray array];
        for (NSDictionary *info in tmp) {
            WeatherInfo *weatherInfo = [[WeatherInfo alloc] initWithDictionary:info];
            [weatherInfoList addObject:weatherInfo];
        }
        
        value = weatherInfoList;
    }
    
    [super setValue:value forKey:key];
}

@end
