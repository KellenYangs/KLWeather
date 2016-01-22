//
//  MainInfo.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"

@interface MainInfo : BaseModel

@property (nonatomic, strong) NSNumber *hunidity;   // Humidity, %
@property (nonatomic, strong) NSNumber *temp_min;   // Minimum temperature at the moment.
@property (nonatomic, strong) NSNumber *temp_max;   // Maximum temperature at the moment.
@property (nonatomic, strong) NSNumber *temp;       // Temperature
@property (nonatomic, strong) NSNumber *pressure;   // Atmospheric pressure
@property (nonatomic, strong) NSNumber *sea_level;  // Atmospheric pressure on the sea level, hPa
@property (nonatomic, strong) NSNumber *grnd_level; // Atmospheric pressure on the ground level, hPa


@end
