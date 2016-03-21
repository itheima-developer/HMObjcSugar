//
//  UILabel+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (HMObjcSugar)

/// 实例化 UILabel
///
/// @param text      text
/// @param fontSize  fontSize
/// @param textColor textColor
///
/// @return UILabel
+ (nonnull instancetype)hm_labelWithText:(nullable NSString *)text
                                fontSize:(CGFloat)fontSize
                               textColor:(nonnull UIColor *)textColor;

@end
