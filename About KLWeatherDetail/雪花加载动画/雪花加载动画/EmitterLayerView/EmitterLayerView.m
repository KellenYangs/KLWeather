//
//  EmitterLayerView.m
//  雪花加载动画
//
//  Created by bcmac3 on 16/1/25.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "EmitterLayerView.h"

@interface EmitterLayerView ()
@end

@implementation EmitterLayerView

/**
 *  替换layer的类
 *
 *  @return 替换当前view的layer的类
 */
+ (Class)layerClass {
    return [CAEmitterLayer class];
}

- (CAEmitterLayer *)emitterLayer {
    return (CAEmitterLayer *)self.layer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.emitterLayer.emitterShape = kCAEmitterLayerLine; // 直线粒子发射器
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    self.emitterLayer.emitterSize = self.frame.size; // 直线粒子发射器
    self.emitterLayer.emitterPosition = CGPointMake(self.frame.size.width * 0.5, -5); // 直线粒子发射器
}

- (void)showEmitter {
    if (!_snowImage) {
        return;
    }
    
    // 直线粒子发射器
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    // 粒子的名字
    snowflake.name = @"snow";
    // 粒子参数的速度乘数因子
    snowflake.birthRate = (_birthRate > 0 ? _birthRate : 1);
    // 粒子生命周期
    snowflake.lifetime = (_lifetime > 0 ? _lifetime : 60);
    // 粒子速度
    snowflake.velocity = (_speed > 0 ? _speed : 10);
    // 粒子的速度范围
    snowflake.velocityRange = (_speedRange >0 ? _speedRange : 10);
    // 粒子y方向的加速度分量(可以理解为重力)
    snowflake.yAcceleration = (_gravity != 0 ? _gravity : 2.0);
    // 每个发射的粒子的初始时候随机的角度
    snowflake.emissionRange = 0.5 * M_PI;
    // 粒子旋转角度
    snowflake.spinRange = 0.25 * M_PI;
    // 获取图片
    snowflake.contents = (id)_snowImage.CGImage;
    // 设置雪花形状的粒子的颜色
    snowflake.color = (_snowColor == nil ? [UIColor whiteColor].CGColor : _snowColor.CGColor);
    // 尺寸
    snowflake.scale = 0.5f;
    // 尺寸变化范围
    snowflake.scaleRange = 0.3f;
    // 添加粒子
    self.emitterLayer.emitterCells = @[snowflake];
    self.alpha = 0.;
}

- (void)show {
    [self showEmitter];
    [UIView animateWithDuration:1.75f animations:^{
        self.alpha = 0.5f;
    }];
}

- (void)hide {
    [UIView animateWithDuration:0.75 animations:^{
        self.alpha = 0.f;
    }];
}

- (void)showEmitterWithType:(EMitterType)type {
    UIImageView *snowAlpha = [[UIImageView alloc] initWithFrame:self.bounds];
    snowAlpha.image        = [UIImage imageNamed:@"alpha"];
    self.maskView          = snowAlpha;
    
    if (type == EMitterTypeSnow) {
        self.birthRate = 5.f;
        self.snowImage = [UIImage imageNamed:@"snow"];
        self.snowColor = [UIColor blackColor];
        self.lifetime = 30.f;
        self.alpha = 0.f;
    }else if(type == EMitterTypeRain) {
        self.birthRate = 100.f;
        self.speed     = 10.f;
        self.gravity   = 2000.f;
        self.snowImage = [UIImage imageNamed:@"rain"];
        self.snowColor = [UIColor blackColor];
        self.lifetime  = 1.f;
        self.alpha     = 0.f;
    }
    [self showEmitter];
}
@end
