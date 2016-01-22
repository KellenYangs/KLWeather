//
//  FontInfomation.m
//  KLWeather
//
//  Created by bcmac3 on 16/1/22.
//  Copyright © 2016年 KellenYangs. All rights reserved.
//

#import "FontInfomation.h"

@implementation FontInfomation

static NSMutableDictionary *_systemFontDictionary = nil; // 系统字体信息

+ (void)initialize {
    if (self == [FontInfomation class]) {
        _systemFontDictionary = [[NSMutableDictionary alloc] init];
        
        // 获取系统字体族
        [FontInfomation getSystemFontList];
    }
}

+ (void)getSystemFontList {
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        [_systemFontDictionary setObject:fontNames forKey:familyName];
    }
}

+ (NSDictionary *)systomFontNameList {
    return [NSDictionary dictionaryWithDictionary:_systemFontDictionary];
}


@end
