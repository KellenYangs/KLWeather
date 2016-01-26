//
//  FadeBlackView.m
//  YoCelsius
//
//  Created by XianMingYou on 15/2/28.
//
//  https://github.com/YouXianMing
//  http://www.cnblogs.com/YouXianMing/
//

#import "FadeBlackView.h"

@implementation FadeBlackView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initial];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    if (self) {
        [self initial];
    }
    return self;
}

- (void)initial {
    self.backgroundColor = [UIColor blackColor];
    self.alpha           = 0.f;
}

- (void)show {
    [UIView animateWithDuration:1.f animations:^{
        self.alpha = 0.75f;
    }];
}

- (void)hide {
    [UIView animateWithDuration:0.75f animations:^{
        self.alpha = 0.f;
    }];
}

@end
