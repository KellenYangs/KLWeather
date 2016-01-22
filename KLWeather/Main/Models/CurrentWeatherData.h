//
//  CurrentWeatherData.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"
#import "Coord.h"
#import "Sys.h"
#import "MainInfo.h"
#import "Wind.h"
#import "Clouds.h"
#import "Weather.h"

/*
 GET请求
 @"http://api.openweathermap.org/data/2.5/weather"
 @{ @"lat"  : @"31.185871",
    @"lon"  : @"121.412593"}
 */
// 31.185871,121.412593
@interface CurrentWeatherData : BaseModel

@property (nonatomic, strong) NSNumber       *cod;      // 状态码
@property (nonatomic, strong) NSNumber       *cityId;   // 城市ID
@property (nonatomic, strong) NSString       *name;     // 城市名字
@property (nonatomic, strong) NSString       *base;     // 检测的站点
@property (nonatomic, strong) Coord          *coord;    // 经纬度坐标

@property (nonatomic, strong) NSNumber       *dt;       // Data receiving time, unix time, GMT

@property (nonatomic, strong) NSArray        *weather;  // 天气信息列表
@property (nonatomic, strong) MainInfo       *main;     // Group of weather parameters (Rain, Snow, Extreme etc.)
@property (nonatomic, strong) Sys            *sys;
@property (nonatomic, strong) Wind           *wind;
@property (nonatomic, strong) Clouds         *clouds;

@end
