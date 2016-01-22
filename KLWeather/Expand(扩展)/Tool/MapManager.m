//
//  MapManager.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "MapManager.h"

@interface MapManager ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@end

@implementation MapManager

- (void)start {
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    //  Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [_locationManager requestWhenInUseAuthorization];
    }
    [_locationManager startUpdatingLocation];
}


#pragma mark -- CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [manager stopUpdatingLocation];
    if (_delegate && [_delegate respondsToSelector:@selector(mapManager:didUpdateAndGetLestCLLocation:)]) {
        CLLocation *location = [locations lastObject];
        [_delegate mapManager:self didUpdateAndGetLestCLLocation:location];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"定位失败");
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位功能关闭");
        if(_delegate && [_delegate respondsToSelector:@selector(mapManagerServerClosed:)]){
            [_delegate mapManagerServerClosed:self];
        }
    }else {
        NSLog(@"定位功能正常开启");
        if (_delegate && [_delegate respondsToSelector:@selector(mapManager:didFailed:)]) {
            NSLog(@"location error : %@", error);
            [_delegate mapManager:self didFailed:error];
        }
    }
}

@synthesize authorizationStatus = _authorizationStatus;
- (CLAuthorizationStatus)authorizationStatus {
    return [CLLocationManager authorizationStatus];
}


@end
