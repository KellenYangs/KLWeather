//
//  City.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "City.h"

@implementation City

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
    
    [super setValue:value forKey:key];
}

@end
