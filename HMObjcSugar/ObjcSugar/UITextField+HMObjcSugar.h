//
//  UITextField+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/24.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (HMObjcSugar)

/// 实例化 UITextField
///
/// @param placeHolder     占位文本
///
/// @return UITextField
+ (nonnull instancetype)hm_textFieldWithPlaceHolder:(nonnull NSString *)placeHolder;

@end
