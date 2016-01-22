//
//  CircleView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView

/**
 *  线条宽度
 */
@property (nonatomic)         CGFloat   lineWidth;

/**
 *  线条颜色
 */
@property (nonatomic, strong) UIColor  *lineColor;

/**
 *  旋转方向(YES:顺时针 NO:逆时钟)
 */
@property (nonatomic)         BOOL      clockWise;

/**
 *  开始角度
 */
@property (nonatomic)         CGFloat   startAngle;

/**
 *  初始化view
 */
- (void)buildView;

/**
 *  做stroke动画
 *
 *  @param value    取值 [0, 1]
 *  @param animated 时候执行动画
 */
- (void)strokeEnd:(CGFloat)value animated:(BOOL)animated duration:(CGFloat)duration;


- (void)strokeStart:(CGFloat)value animated:(BOOL)animated duration:(CGFloat)duration;

/**
 *  创建出默认配置的view
 *
 *  @param frame 设置用的frame值
 *
 *  @return 实例对象
 */
+ (instancetype)createDefaultViewWithFrame:(CGRect)frame;

@end
