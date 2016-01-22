//
//  Wind.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"

@interface Wind : BaseModel

@property (nonatomic, strong) NSNumber *speed; // Wind speed, mps
@property (nonatomic, strong) NSNumber *deg;   // Wind direction, degrees (meteorological)


@end
