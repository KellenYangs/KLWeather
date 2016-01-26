//
//  KLViewController.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/25.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "KLViewController.h"

// 定位
#import "MapManager.h"

// model数据
#import "CurrentWeatherData.h"
#import "CurrentConditions.h"

// 获取网络数据
#import "GetWeatherData.h"

// 天气的View
#import "WeatherView.h"
#import "SearchView.h"


// 更新 + 变黑 + 失败
#import "UpdatingView.h"
#import "FadeBlackView.h"
#import "FailedLongPressView.h"

#import "TWMessageBarManager.h"

// 控制器
#import "ForecastController.h"

// 动画生成器
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"

#define RADIAN(degress) ((M_PI * (degress)) / 180.f)

@interface KLViewController ()<MapManagerLocationDelegate, UITableViewDelegate, GetWeatherDataDelegate, WeatherViewDelegate, UIViewControllerTransitioningDelegate, FailedLongPressViewDelegate>

@property (nonatomic, strong) MapManager *mapManager;
@property (nonatomic, strong) GetWeatherData *getWeatherData;
@property (nonatomic, strong) FadeBlackView *fadeBlackView;
@property (nonatomic, strong) UpdatingView *updatingView;
@property (nonatomic, strong) WeatherView *weatherView;

@property (nonatomic, strong) FailedLongPressView *failedView;

@property (nonatomic, assign) BOOL firstTimeLoadingData;

@end

@implementation KLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getLocationAndFadeShow];
}

#pragma mark -- Private Event
- (void)getLocationAndFadeShow {
    [self.fadeBlackView show];
    [self.updatingView show];
    [self.mapManager start];
}

- (void)getCityIdAndFadeShow {
    
    // 显示出等待页面
    [self.fadeBlackView show];
    [self.updatingView show];
}

- (void)delayRunEvent:(id)object {
    self.getWeatherData.location = object;
    [self.getWeatherData startGetLocationWeatherData];
}

/**
 *  上拉进入新的控制器
 *
 *  @param condition 新控制器需要的数据
 */
- (void)pullUpEventWithData:(CurrentConditions *)condition {
    
    [GCDQueue executeInMainQueue:^{
        
        ForecastController *forecastCV    = [ForecastController new];
        forecastCV.transitioningDelegate  = self;
        forecastCV.modalPresentationStyle = UIModalPresentationCustom;
        forecastCV.weatherCondition       = condition;
        
        [self presentViewController:forecastCV
                           animated:YES
                         completion:^{}];
        
    } afterDelaySecs:0.05f];
}

/**
 *  下拉更新数据
 */
- (void)pullDownToRefreshData {
    
    NSLog(@"下拉获取数据");
    [self getLocationAndFadeShow];
}


#pragma mark -- MapManagerLocationDelegate
- (void)mapManager:(MapManager *)manager didUpdateAndGetLestCLLocation:(CLLocation *)location {
//    NSLog(@"%@",location); // <+31.18776402,+121.40805812>
    NSLog(@"定位成功");
    /**  取消延迟执行 */
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    [self performSelector:@selector(delayRunEvent:) withObject:location afterDelay:0.3f];
}

- (void)mapManager:(MapManager *)manager didFailed:(NSError *)error {
    NSLog(@"定位失败");
    
    [self.updatingView showFailed];
    
    [GCDQueue executeInMainQueue:^{
        
        [self.fadeBlackView hide];
        [self.updatingView hide];
        
    } afterDelaySecs:2.5f];
    
    [GCDQueue executeInMainQueue:^{
        
        [self.failedView show];
        
    } afterDelaySecs:2.5f];
    
    [GCDQueue executeInMainQueue:^{
        
        [[TWMessageBarManager sharedInstance] \
         showMessageWithTitle:@"Failed to locate"
         description:@"Sorry, temporarily unable to locate your position."
         type:TWMessageBarMessageTypeError
         callback:^{}];
        
    } afterDelaySecs:1.f];
    
}

- (void)mapManagerServerClosed:(MapManager *)manager {
    NSLog(@"定位服务关闭");
    [GCDQueue executeInMainQueue:^{
        
        [self.fadeBlackView hide];
        [self.updatingView hide];
        
    } afterDelaySecs:1.5];
    
    [GCDQueue executeInMainQueue:^{
        
        [self.failedView show];
        
    } afterDelaySecs:1.5f];
    
    [GCDQueue executeInMainQueue:^{
        
        [[TWMessageBarManager sharedInstance] \
         showMessageWithTitle:@"Failed to locate"
         description:@"Please turn on your Locations Service."
         type:TWMessageBarMessageTypeError
         callback:^{}];
        
    } afterDelaySecs:0.f];

}

#pragma mark -- GetWeatherDataDelegate
- (void)weatherData:(id)object success:(BOOL)sucess {
    NSLog(@"数据加载成功否？%@", sucess ? @"是的" : @"没有");
    if (sucess) {
        NSLog(@"%@", object);
        
        // 获取数据
        CurrentWeatherData *data       = [object valueForKey:@"WeatherData"];
        CurrentConditions  *conditions = [object valueForKey:@"WeatherConditions"];
        
        // 先获取温度
        self.weatherView.weahterData       = data;
        self.weatherView.weatherConditions = conditions;
        
        // 先隐藏,再显示
        [self.weatherView hide];
        
        [GCDQueue executeInMainQueue:^{
            
            [self.weatherView show];
            [self.fadeBlackView hide];
            [self.updatingView hide];
            
        } afterDelaySecs:1.f];
        
        [GCDQueue executeInMainQueue:^{
            
            [self.failedView remove];
            
        } afterDelaySecs:1.f];

    }else {
        [self.updatingView showFailed];
        [GCDQueue executeInMainQueue:^{
            
            [self.fadeBlackView hide];
            [self.updatingView  hide];
            
        } afterDelaySecs:2.51f];
        
        
        [GCDQueue executeInMainQueue:^{
            
            [self.failedView show];
            
        } afterDelaySecs:2.51f];
        
        [self showErrorInfo];
    }
}

- (void)showErrorInfo {
    
    [GCDQueue executeInMainQueue:^{
        
        [[TWMessageBarManager sharedInstance] \
         showMessageWithTitle:@"Network Unreachable"
         description:@"Please try later."
         type:TWMessageBarMessageTypeError
         callback:^{}];
        
    } afterDelaySecs:1.f];
}
#pragma mark -- FailedLongPressViewDelegate
- (void)pressEvent:(FailedLongPressView *)view {
    
    [self.failedView hide];
    
    [self getLocationAndFadeShow];
}

#pragma mark - 定制转场动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    // 推出控制器的动画
    return [PresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    // 退出控制器动画
    return [DismissingAnimator new];
}


#pragma mark -- Getter
- (MapManager *)mapManager {
    if (!_mapManager) {
        _mapManager = [[MapManager alloc] init];
        _mapManager.delegate = self;
    }
    return _mapManager;
}

- (GetWeatherData *)getWeatherData {
    if (!_getWeatherData) {
        _getWeatherData = [[GetWeatherData alloc] init];
        _getWeatherData.delegate = self;
    }
    return _getWeatherData;
}

- (FadeBlackView *)fadeBlackView {
    if (!_fadeBlackView) {
        _fadeBlackView = [[FadeBlackView alloc] initWithFrame:CGRectZero];
        [self.view addSubview:_fadeBlackView];
    }
    return _fadeBlackView;
}

- (UpdatingView *)updatingView {
    if (!_updatingView) {
        _updatingView = [[UpdatingView alloc] initWithFrame:CGRectZero];
        _updatingView.center = self.view.center;
        [self.view addSubview:_updatingView];
    }
    return _updatingView;
}

- (WeatherView *)weatherView {
    if (!_weatherView) {
        _weatherView = [[WeatherView alloc] initWithFrame:self.view.bounds];
        _weatherView.layer.masksToBounds = YES;
        _weatherView.delegate            = self;
        [_weatherView buildView];
        [self.view addSubview:_weatherView];
    }
    return _weatherView;
}

- (FailedLongPressView *)failedView {
    if (!_failedView) {
        // 加载失败后显示的view
        _failedView          = [[FailedLongPressView alloc] initWithFrame:self.view.bounds];
        _failedView.delegate = self;
        [_failedView buildView];
        [self.view addSubview:_failedView];
    }
    return _failedView;
}

@end
