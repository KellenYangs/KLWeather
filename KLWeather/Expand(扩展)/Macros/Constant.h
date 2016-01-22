//
//  Constant.h
//  KLWeather
//
//  Created by bcmac3 on 16/1/21.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define ScreenWidth   ([UIScreen mainScreen].bounds.size.width)
#define ScreenHeight  ([UIScreen mainScreen].bounds.size.height)

#define StatusBarHeight       20.0f
#define NavigationBarHeight   44.0f
#define TabBarHeight          49.0f
#define StatusBarAndNavigationBarHeight    64.0f


#define  iPhone4_4s   (ScreenWidth == 320.f && ScreenHeight == 480.f ? YES : NO)
#define  iPhone5_5s   (ScreenWidth == 320.f && ScreenHeight == 568.f ? YES : NO)
#define  iPhone6      (ScreenWidth == 375.f && ScreenHeight == 667.f ? YES : NO)
#define  iPhone6_plus (ScreenWidth == 414.f && ScreenHeight == 736.f ? YES : NO)

#endif /* Constant_h */
