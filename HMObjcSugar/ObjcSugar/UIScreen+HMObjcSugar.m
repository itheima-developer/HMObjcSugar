//
//  UIScreen+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIScreen+HMObjcSugar.h"

@implementation UIScreen (HMObjcSugar)

+ (CGFloat)hm_screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)hm_screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)hm_scale {
    return [UIScreen mainScreen].scale;
}

@end
