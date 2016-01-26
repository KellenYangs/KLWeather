//
//  SearchView.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/25.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchView;

@protocol SearchViewDelegate <NSObject>

- (void)currentLocationWithView:(SearchView *)view;

@end


@interface SearchView : UIView

@property (nonatomic, weak) id<SearchViewDelegate> delegate;

- (void)buildView;

@end
