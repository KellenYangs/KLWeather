//
//  AlphaView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlphaView : UIView

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) NSArray *locations;
@property (nonatomic)         CGPoint  startPoint;
@property (nonatomic)         CGPoint  endPoint;

- (void)alphaType;

@end
