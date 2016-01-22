//
//  HumidityView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HumidityView : UIView
/**
 *  百分比
 */
@property (nonatomic) CGFloat percent;

- (void)buildView;

- (void)show;
- (void)hide;

@end
