//
//  MapManager.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreLocation;
@class MapManager;
@protocol MapManagerLocationDelegate <NSObject>
@optional
- (void)mapManager:(MapManager *)manager didUpdateAndGetLestCLLocation:(CLLocation *)location;
- (void)mapManager:(MapManager *)manager didFailed:(NSError *)error;
- (void)mapManagerServerClosed:(MapManager *)manager;
@end


@interface MapManager : NSObject
@property (nonatomic, weak) id<MapManagerLocationDelegate> delegate;
@property (nonatomic, readonly) CLAuthorizationStatus authorizationStatus;

- (void)start;
@end
