//
//  ViewController.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/21.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "ViewController.h"

// 定位
#import "MapManager.h"

// model数据
#import "CurrentWeatherData.h"
#import "CurrentConditions.h"

// 获取网络数据
#import "GetWeatherData.h"

// 天气的View
#import "WeatherView.h"
#import "MaxTempView.h"



#define RADIAN(degress) ((M_PI * (degress)) / 180.f)

@interface ViewController () <MapManagerLocationDelegate, UITableViewDelegate, GetWeatherDataDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor grayColor];
   
    MaxTempView *view = [[MaxTempView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    view.maxTemp = 10;
    view.minTemp = -10;
    [view buildView];
    [view show];
    
   
    
    
}


@end
