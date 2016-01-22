//
//  AnimatedLineView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimatedLineView : UIView

/**
 *  显示的图片
 */
@property (nonatomic, strong) UIImage *image;

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


@end
