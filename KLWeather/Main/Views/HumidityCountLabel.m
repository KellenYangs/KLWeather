//
//  HumidityCountLabel.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "HumidityCountLabel.h"

@interface HumidityCountLabel () <NumberCountDelegate>

@end

@implementation HumidityCountLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.countLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.countLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.countLabel];
        self.countLabel.alpha = 0;
        
        self.humidityCount = [HumidityCount new];
        self.humidityCount.delegate = self;
    }
    return self;
}

#pragma mark -- NumberCountDelegate
- (void)numberCount:(NumberCount *)numberCount currentString:(NSAttributedString *)string {
    self.countLabel.attributedText = string;
}

- (void)showDuration:(CGFloat)duration {
    self.humidityCount.fromValue = self.fromValue;
    self.humidityCount.toValue = self.toValue;
    self.humidityCount.duration = duration;
    self.countLabel.transform = CGAffineTransformMake(1.5, 0, 0, 1.5, 0, 0);
    [self.humidityCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
        self.countLabel.alpha = 1.f;
    }];
}

- (void)hideDuration:(CGFloat)duration {
    self.humidityCount.fromValue = self.toValue;
    self.humidityCount.toValue   = 0;
    self.humidityCount.duration  = duration;
    
    [self.humidityCount startAnimation];
    
    [UIView animateWithDuration:duration animations:^{
        self.countLabel.transform = CGAffineTransformMake(0.5, 0, 0, 0.5, 0, 0);
        self.countLabel.alpha     = 0.f;
    }];
}


@end
