//
//  CALayer+MaskLayer.h
//  雪花加载动画
//
//  Created by bcmac3 on 16/1/25.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (MaskLayer)

/**
 *  根据PNG图片创建出用于mask的layer
 *
 *  @param size  mask的尺寸
 *  @param image 用于mask的图片
 *
 *  @return 创建好的mask的layer
 */
+ (CALayer *)createMaskLayerWithSize:(CGSize)size maskPNGImage:(UIImage *)image;

@end
