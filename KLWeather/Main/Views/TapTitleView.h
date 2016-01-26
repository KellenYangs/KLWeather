//
//  TapTitleView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/25.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TapTitleView;

@protocol TapTitleViewDelegate <NSObject>

@optional
- (void)tapTitleView:(TapTitleView *)tapView;

@end

@interface TapTitleView : UIView

@property (nonatomic, weak)   id<TapTitleViewDelegate>   delegate;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIColor  *normalColor;
@property (nonatomic, strong) UIColor  *tapColor;
@property (nonatomic, strong) UIFont   *font;


@end
