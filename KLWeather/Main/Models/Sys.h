//
//  Sys.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "BaseModel.h"

@interface Sys : BaseModel

@property (nonatomic, strong) NSNumber *message;
@property (nonatomic, copy  ) NSString *country;
@property (nonatomic, strong) NSNumber *sunset;
@property (nonatomic, strong) NSNumber *sunrise;

@end
