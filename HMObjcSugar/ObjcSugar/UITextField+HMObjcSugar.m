//
//  UITextField+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/24.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UITextField+HMObjcSugar.h"

@implementation UITextField (HMObjcSugar)

+ (instancetype)hm_textFieldWithPlaceHolder:(NSString *)placeHolder {

    UITextField *textField = [[self alloc] init];
    
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = placeHolder;
    
    return textField;
}

@end
