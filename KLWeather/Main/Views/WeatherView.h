//
//  WeatherView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrentWeatherData.h"
#import "CurrentConditions.h"

@protocol WeatherViewDelegate <NSObject>

- (void)pullUpEventWithData:(CurrentConditions *)conditions;
- (void)pullDownToRefreshData;

@end

@interface WeatherView : UIView

@property (nonatomic, weak) id<WeatherViewDelegate> delegate;

/**
 *  天气的数据
 */
@property (nonatomic, strong) CurrentWeatherData  *weahterData;
@property (nonatomic, strong) CurrentConditions   *weatherConditions;

/**
 *  显示动画
 */
- (void)show;

/**
 *  隐藏动画
 */
- (void)hide;

/**
 *  创建出view
 */
- (void)buildView;

@end
