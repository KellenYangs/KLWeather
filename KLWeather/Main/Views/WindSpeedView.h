//
//  WindSpeedView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WindSpeedView : UIView

/**
 *  一秒钟旋转几圈
 */
@property (nonatomic) CGFloat circleByOneSecond;

/**
 *  风的速度
 */
@property (nonatomic) CGFloat windSpeed;

/**
 *  创建出view
 */
- (void)buildView;

/**
 *  显示
 */
- (void)show;

/**
 *  隐藏
 */
- (void)hide;

@end
