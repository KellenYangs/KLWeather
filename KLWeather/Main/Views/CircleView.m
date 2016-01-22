//
//  CircleView.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "CircleView.h"

// 将度数转换为弧度
#define   RADIAN(degrees)  ((M_PI * (degrees))/ 180.f)

// 将弧度转换为度数
#define   DEGREES(radian)  ((radian) * 180.f / M_PI)

@interface CircleView ()
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@end

@implementation CircleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createCircleLayer];
    }
    return self;
}

- (void)createCircleLayer {
    self.circleLayer = [CAShapeLayer layer];
    self.circleLayer.frame = self.bounds;
    [self.layer addSublayer:self.circleLayer];
}

- (void)buildView {
    CGFloat lineWidth  = self.lineWidth <= 0 ? 1 : self.lineWidth;
    UIColor *lineColor = self.lineColor == nil ? [UIColor blackColor] : self.lineColor;
    CGSize size = self.bounds.size;
    CGFloat radius = self.width / 2.f - lineWidth / 2.f;
    
    // 旋转方向
    BOOL clockWise = self.clockWise;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;
    if (clockWise) {
        startAngle = -RADIAN(180 - self.startAngle);
        endAngle = RADIAN(180 + self.startAngle);
    }else {
        startAngle = RADIAN(180 - self.startAngle);
        endAngle = -RADIAN(180 + self.startAngle);
    }
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(size.height * 0.5, size.width * 0.5) radius:radius startAngle:startAngle endAngle:endAngle clockwise:clockWise];
    self.circleLayer.path = circlePath.CGPath;
    self.circleLayer.strokeColor = lineColor.CGColor;
    self.circleLayer.fillColor = [UIColor clearColor].CGColor;
    self.circleLayer.lineWidth = lineWidth;
    self.circleLayer.strokeEnd = 0.f;
}

- (void)strokeEnd:(CGFloat)value animated:(BOOL)animated duration:(CGFloat)duration {
    if (value <=0) {
        value = 0;
    }else if (value >=1 ) {
        value = 1.f;
    }
    if (animated) {
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
        keyAnimation.keyPath = @"strokeEnd";
        keyAnimation.duration = duration;
        keyAnimation.values = [YXEasing calculateFrameFromValue:self.circleLayer.strokeEnd toValue:value func:CubicEaseInOut frameCount:duration * 30];
        self.circleLayer.strokeEnd = value;
        [self.circleLayer addAnimation:keyAnimation forKey:nil];
    }else {
        // 设置变化动画过程是否显示，默认为YES不显示
        [CATransaction setDisableActions:YES];
        self.circleLayer.strokeEnd = value;
        [CATransaction setDisableActions:NO];
    }
}

- (void)strokeStart:(CGFloat)value animated:(BOOL)animated duration:(CGFloat)duration {
    if (value <=0) {
        value = 0;
    }else if (value >=1 ) {
        value = 1.f;
    }
    if (animated) {
        CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
        keyAnimation.keyPath = @"strokeStart";
        keyAnimation.duration = duration;
        keyAnimation.values = [YXEasing calculateFrameFromValue:self.circleLayer.strokeStart toValue:value func:CubicEaseInOut frameCount:duration * 30];
        self.circleLayer.strokeStart = value;
        [self.circleLayer addAnimation:keyAnimation forKey:nil];
    }else {
        // 设置变化动画过程是否显示，默认为YES不显示
        [CATransaction setDisableActions:YES];
        self.circleLayer.strokeStart = value;
        [CATransaction setDisableActions:NO];
    }

}

+ (instancetype)createDefaultViewWithFrame:(CGRect)frame {
    CircleView *circleView = [[CircleView alloc] initWithFrame:frame];
    circleView.lineWidth = 2.f;
//    circleView.lineColor = [UIColor blackColor];
    circleView.clockWise = YES;
    circleView.startAngle = 180;
    [circleView buildView];
    return circleView;
}





@end
