//
//  WeatherInfo.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"
#import "Temp.h"
#import "Weather.h"

@interface WeatherInfo : BaseModel

@property (nonatomic, strong) NSArray        *weather;   // Weather信息列表
@property (nonatomic, strong) Temp           *temp;      // Temperature, Kelvin (subtract 273.15 to convert to Celsius)

@property (nonatomic, strong) NSNumber       *clouds;    // Cloudiness, %
@property (nonatomic, strong) NSNumber       *humidity;  // Humidity, %
@property (nonatomic, strong) NSNumber       *dt;        // Data receiving time, unix time, GMT
@property (nonatomic, strong) NSNumber       *speed;     // Wind speed, mps
@property (nonatomic, strong) NSNumber       *pressure;  // Atmospheric pressure (on the sea level, if there is no sea_level or grnd_level data), hPa
@property (nonatomic, strong) NSNumber       *deg;       // Wind direction, degrees (meteorological)

@end
