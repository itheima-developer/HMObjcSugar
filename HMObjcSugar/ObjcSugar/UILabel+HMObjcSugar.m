//
//  UILabel+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UILabel+HMObjcSugar.h"

@implementation UILabel (HMObjcSugar)

+ (instancetype)hm_labelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    label.numberOfLines = 0;
    
    [label sizeToFit];
    
    return label;
}

@end
