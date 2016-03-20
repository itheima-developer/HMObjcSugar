//
//  UIScreen+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (HMObjcSugar)

/// 屏幕宽度
+ (CGFloat)hm_screenWidth;
/// 屏幕高度
+ (CGFloat)hm_screenHeight;
/// 分辨率
+ (CGFloat)hm_scale;

@end
