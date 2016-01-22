//
//  BaseModel.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        self = [super init];
        if (self) {
            [self setValuesForKeysWithDictionary:dictionary];
        }
        return self;
    }else {
        return nil;
    }
}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([value isKindOfClass:[NSNull class]])  {
        return;
    }
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(nonnull NSString *)key {
    
}


@end
