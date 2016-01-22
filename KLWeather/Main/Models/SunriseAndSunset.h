//
//  SunriseAndSunset.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SunriseAndSunset : NSObject

@property (nonatomic)                   NSTimeInterval  utcSec;      // 获取到的UTC时间
@property (nonatomic, strong, readonly) NSString       *timeString;  // 时间字符串

/**
 *  开始处理时间信息
 */
- (void)accessUtcSec;

@end
