//
//  UILabel+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UILabel+HMObjcSugar.h"

@implementation UILabel (HMObjcSugar)

+ (instancetype)hm_labelWithText:(NSString *)text {
    return [self hm_labelWithText:text fontSize:14 textColor:[UIColor darkGrayColor] alignment:NSTextAlignmentLeft];
}

+ (instancetype)hm_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize {
    return [self hm_labelWithText:text fontSize:fontSize textColor:[UIColor darkGrayColor] alignment:NSTextAlignmentLeft];
}

+ (instancetype)hm_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    return [self hm_labelWithText:text fontSize:fontSize textColor:textColor alignment:NSTextAlignmentLeft];
}

+ (instancetype)hm_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[self alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    
    [label sizeToFit];
    
    return label;
}

@end
