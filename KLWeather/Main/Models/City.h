//
//  City.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"
#import "Coord.h"

@interface City : BaseModel

@property (nonatomic, strong) Coord          *coord;      // 经纬度

@property (nonatomic, strong) NSNumber       *cityId;     // 城市ID
@property (nonatomic, strong) NSString       *country;    // 国家
@property (nonatomic, strong) NSString       *name;       // 城市名字

@property (nonatomic, strong) NSNumber       *population;

@end
