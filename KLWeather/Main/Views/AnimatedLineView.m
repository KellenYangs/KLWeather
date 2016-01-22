//
//  AnimatedLineView.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "AnimatedLineView.h"

@interface AnimatedLineView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, assign) CGRect startRect;
@property (nonatomic, assign) CGRect midRect;
@property (nonatomic, assign) CGRect endRect;

@end

@implementation AnimatedLineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initRects];
        self.imageView = [[UIImageView alloc] initWithFrame:self.startRect];
        self.imageView.alpha = 0.f;
        [self addSubview:self.imageView];
    }
    return self;
}

- (void)initRects {
    CGRect rect = self.bounds;
    self.startRect = CGRectMake(0, -10, rect.size.width, rect.size.height * 0.5);
    self.midRect = CGRectMake(0, 0, rect.size.width, rect.size.height * 0.5);
    self.endRect = CGRectMake(0, -5, rect.size.width, rect.size.height * 0.5);
}

- (void)resetImageView {
    self.imageView.alpha = 0;
    self.imageView.frame = self.startRect;
}

- (void)showWithDuration:(CGFloat)duration animated:(BOOL)animated {
    [self resetImageView];
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.imageView.frame = self.midRect;
            self.imageView.alpha = 1;
        }];
    }else {
        self.imageView.frame = self.midRect;
        self.imageView.alpha = 1;
    }
}

- (void)hideWithDuration:(CGFloat)duration animated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:duration animations:^{
            self.imageView.frame = self.endRect;
            self.imageView.alpha = 0.f;
        }];
    } else {
        self.imageView.frame = self.endRect;
        self.imageView.alpha = 0.f;
    }
}

@synthesize image = _image;
- (UIImage *)image{
    return _image;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}














@end
