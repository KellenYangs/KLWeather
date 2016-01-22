//
//  HumidityCountLabel.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HumidityCount.h"

@interface HumidityCountLabel : UIView

@property (nonatomic, assign) CGFloat fromValue;

@property (nonatomic, assign) CGFloat toValue;

/**
 *  动画引擎
 */
@property (nonatomic, strong) HumidityCount *humidityCount;

@property (nonatomic, strong) UILabel *countLabel;

/**
 *  显示动画
 *
 *  @param duration 动画时间
 */
- (void)showDuration:(CGFloat)duration;

/**
 *  隐藏动画
 *
 *  @param duration 隐藏时间
 */
- (void)hideDuration:(CGFloat)duration;

@end
