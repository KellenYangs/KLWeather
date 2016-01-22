//
//  RotatedAngleView.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "RotatedAngleView.h"

// 将度数转换为弧度
#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

// 将弧度转换为度数
#define   DEGREES(radian)  ((radian) * 180.f / M_PI)

@interface RotatedAngleView ()

/**
 *  默认的旋转值
 */
@property (nonatomic, assign) CGAffineTransform defaultTransform;

@end

@implementation RotatedAngleView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.defaultTransform = self.transform;
    }
    return self;
}

- (void)roateAngle:(CGFloat)angle {
    self.transform = CGAffineTransformRotate(self.defaultTransform, RADIAN(angle));
}

- (void)roateAngle:(CGFloat)angle duration:(CGFloat)duration {
    [UIView animateWithDuration:duration animations:^{
        [self roateAngle:angle];
    } completion:^(BOOL finished) {
        
    }];
}

- (void)recoverDuration:(CGFloat)duration {
    [self roateAngle:0 duration:duration];
}




















@end
