//
//  NumberCount.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NumberCount;
@protocol NumberCountDelegate <NSObject>

@optional
/**
 *  最原始的方法
 *
 *  @param numberCount 对象自己
 *  @param number      变化的值
 */
- (void)numberCount:(NumberCount *)numberCount currentNumber:(NSNumber *)number;
/**
 *  子类可以实现的方法
 *
 *  @param numberCount 对象自己
 *  @param string      子类返回的富文本
 */
- (void)numberCount:(NumberCount *)numberCount currentSting:(NSAttributedString *)string;

@end


@interface NumberCount : NSObject

@property (nonatomic, weak) id<NumberCountDelegate> delegate;

/**
 *  动画实体
 */
@property (nonatomic, strong) POPBasicAnimation *countAnimation;

@property (nonatomic, assign) CGFloat fromValue;

@property (nonatomic, assign) CGFloat toValue;

@property (nonatomic, assign) CGFloat duration;

- (void)startAnimation;






@end
