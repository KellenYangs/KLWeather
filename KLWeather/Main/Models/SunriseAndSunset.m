//
//  SunriseAndSunset.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "SunriseAndSunset.h"

@interface SunriseAndSunset ()

@property (nonatomic, strong) NSDateFormatter *formatter;
@property (nonatomic, strong) NSString        *timeString;

@end

@implementation SunriseAndSunset

- (instancetype)init {
    self = [super init];
    if (self) {
        self.formatter            = [NSDateFormatter new];
        self.formatter.dateFormat = @"HH : mm";
    }
    return self;
}

- (void)accessUtcSec {
    // Unix UTC
    NSTimeInterval seconds = (self.utcSec <= 0 ? 0 : self.utcSec);
    
    // 获取到了UTC时间
    NSDate *utcDate = [NSDate dateWithTimeIntervalSince1970:seconds];
    
    // 设置时间格式
    self.timeString = [self.formatter stringFromDate:utcDate];
}


@end
