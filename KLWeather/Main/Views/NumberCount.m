//
//  NumberCount.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "NumberCount.h"
#import "POP.h"

@implementation NumberCount

- (instancetype)init {
    self = [super init];
    if (self) {
        self.countAnimation = [POPBasicAnimation animation];
    }
    return self;
}

- (void)startAnimation {
    self.countAnimation.fromValue = @(self.fromValue);
    self.countAnimation.toValue = @(self.toValue);
    self.countAnimation.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.69 :0.11 :0.32 :0.88];
    self.countAnimation.duration = self.duration <= 0 ? 1.f : self.duration;
    // 只有执行了代理才会执行计数引擎
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberCount:currentNumber:)]) {
        /* 将计算出来的值通过writeBlock动态给控件设定 */
        self.countAnimation.property = [POPMutableAnimatableProperty propertyWithName:@"conutAnimation" initializer:^(POPMutableAnimatableProperty *prop) {
            prop.writeBlock = ^(id obj, const CGFloat values[]){
                NSNumber *number = @(values[0]);
                [_delegate numberCount:self currentNumber:number];
            };
        }];
        [self pop_addAnimation:self.countAnimation forKey:nil];
    }
    
}


@end
