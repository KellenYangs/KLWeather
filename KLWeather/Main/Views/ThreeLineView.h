//
//  ThreeLineView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimatedLineView.h"

@interface ThreeLineView : UIView

/**
 *  显示出来
 *
 *  @param duration 动画持续时间
 *  @param animated 是否执行动画
 */
- (void)showWithDuration:(CGFloat)duration animated:(BOOL)animated;

/**
 *  隐藏
 *
 *  @param duration 动画持续时间
 *  @param animated 是否执行动画
 */
- (void)hideWithDuration:(CGFloat)duration animated:(BOOL)animated;

/**
 *  风的速度
 */
@property (nonatomic) CGFloat circleByOneSecond; // 这个值必须给出

/**
 *  一秒钟旋转几圈
 *
 *  @param circleByOneSecond 一秒钟旋转几圈
 */
- (void)rotateImageViewWithCircleByOneSecond;

@end
