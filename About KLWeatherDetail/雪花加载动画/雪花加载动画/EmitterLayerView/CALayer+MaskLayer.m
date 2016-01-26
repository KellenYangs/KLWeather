//
//  CALayer+MaskLayer.m
//  雪花加载动画
//
//  Created by bcmac3 on 16/1/25.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "CALayer+MaskLayer.h"

@implementation CALayer (MaskLayer)

+ (CALayer *)createMaskLayerWithSize:(CGSize)size maskPNGImage:(UIImage *)image {
    CALayer *layer = [CALayer layer];
    layer.anchorPoint = CGPointMake(0, 0);
    layer.bounds = CGRectMake(0, 0, size.width, size.height);
    if (image) {
        layer.contents = (__bridge id)(image.CGImage);
    }
    return layer;
}

@end
