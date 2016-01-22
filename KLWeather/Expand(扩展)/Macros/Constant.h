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


#define  iPhone4_4s   (Width == 320.f && Height == 480.f ? YES : NO)
#define  iPhone5_5s   (Width == 320.f && Height == 568.f ? YES : NO)
#define  iPhone6      (Width == 375.f && Height == 667.f ? YES : NO)
#define  iPhone6_plus (Width == 414.f && Height == 736.f ? YES : NO)

#endif /* Constant_h */
