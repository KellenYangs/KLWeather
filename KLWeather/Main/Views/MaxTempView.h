//
//  MaxTempView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaxTempView : UIView

/**
 *  最高温度
 */
@property (nonatomic) CGFloat maxTemp;

/**
 *  最低温度
 */
@property (nonatomic) CGFloat minTemp;

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
