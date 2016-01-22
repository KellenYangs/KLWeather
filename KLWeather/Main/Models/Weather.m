//
//  Weather.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "Weather.h"

@implementation Weather

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.weatherId = value;
    }
    
    if ([key isEqualToString:@"description"]) {
        self.descriptionInfo = value;
    }
    [super setValue:value forUndefinedKey:key];
}

@end
