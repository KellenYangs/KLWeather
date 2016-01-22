//
//  CurrentConditions.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"
#import "City.h"
#import "WeatherInfo.h"

/*
 GET请求
 @"http://api.openweathermap.org/data/2.5/forecast/daily"
 @{ @"lat"  : @"31.185871",
    @"lon"  : @"121.412593"}
 */

@interface CurrentConditions : BaseModel

@property (nonatomic, strong) City           *city;     // 城市信息
@property (nonatomic, strong) NSArray        *list;     // WeatherInfo信息列表


@property (nonatomic, strong) NSNumber       *message;  // System parameter, do not use it
@property (nonatomic, strong) NSString       *cod;
@property (nonatomic, strong) NSNumber       *cnt;      // Number of lines returned by this API call

@end
