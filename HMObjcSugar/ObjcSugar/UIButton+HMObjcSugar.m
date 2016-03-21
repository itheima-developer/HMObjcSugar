//
//  UIButton+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIButton+HMObjcSugar.h"

@implementation UIButton (HMObjcSugar)

+ (instancetype)hm_buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor {
    NSAttributedString *attributedText = [[NSAttributedString alloc]
                                          initWithString:title
                                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                                                       NSForegroundColorAttributeName: textColor}];
    
    return [self hm_buttonWithAttributedText:attributedText];
}

+ (instancetype)hm_buttonWithAttributedText:(NSAttributedString *)attributedText {
    return [self hm_buttonWithAttributedText:attributedText imageName:nil backImageName:nil highlightSuffix:nil];
}

+ (instancetype)hm_buttonWithImageName:(NSString *)imageName highlightSuffix:(NSString *)highlightSuffix {
    
    return [self hm_buttonWithAttributedText:nil imageName:imageName backImageName:nil highlightSuffix:highlightSuffix];
}

+ (instancetype)hm_buttonWithImageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix {
    
    return [self hm_buttonWithAttributedText:nil imageName:imageName backImageName:backImageName highlightSuffix:highlightSuffix];
}

+ (instancetype)hm_buttonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix {
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]
                                          initWithString:title
                                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                                                       NSForegroundColorAttributeName: textColor}];
    
    return [self hm_buttonWithAttributedText:attributedText imageName:imageName backImageName:backImageName highlightSuffix:highlightSuffix];
}

+ (instancetype)hm_buttonWithAttributedText:(NSAttributedString *)attributedText imageName:(NSString *)imageName backImageName:(NSString *)backImageName highlightSuffix:(NSString *)highlightSuffix {
    
    UIButton *button = [[self alloc] init];
    
    [button setAttributedTitle:attributedText forState:UIControlStateNormal];
    
    if (imageName != nil) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [imageName stringByAppendingString:highlightSuffix];
        [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }
    
    if (backImageName != nil) {
        [button setBackgroundImage:[UIImage imageNamed:backImageName] forState:UIControlStateNormal];
        
        NSString *highlightedImageName = [backImageName stringByAppendingString:highlightSuffix];
        [button setBackgroundImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    }
    
    [button sizeToFit];
    
    return button;
}

@end
