//
//  Temp.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"

@interface Temp : BaseModel

@property (nonatomic, strong) NSNumber       *min;  // Minimum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded (use these parameter optionally)
@property (nonatomic, strong) NSNumber       *max;  // Maximum temperature at the moment. This is deviation from current temp that is possible for large cities and megalopolises geographically expanded (use these parameter optionally)

@property (nonatomic, strong) NSNumber       *morn;  // 早晨
@property (nonatomic, strong) NSNumber       *day;   // 白天
@property (nonatomic, strong) NSNumber       *night; // 下午
@property (nonatomic, strong) NSNumber       *eve;   // 午夜

@end
