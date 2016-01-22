//
//  TitleMoveLabel.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TITLE_MOVE_LABEL_SHOW_DURATION  1.75
#define TITLE_MOVE_LABEL_HIDE_DURATION  0.75

@interface TitleMoveLabel : UIView

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, assign) CGFloat moveGap;

- (void)buildView;

- (void)show;

- (void)hide;

+ (TitleMoveLabel *)withText:(NSString *)text;

@end
