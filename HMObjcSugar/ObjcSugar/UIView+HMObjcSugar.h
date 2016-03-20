//
//  UIView+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HMObjcSugar)

#pragma mark - Frame
@property (nonatomic) CGPoint hm_viewOrigin;
@property (nonatomic) CGSize hm_viewSize;

#pragma mark - Frame Origin
@property (nonatomic) CGFloat hm_x;
@property (nonatomic) CGFloat hm_y;

#pragma mark - Frame Size
@property (nonatomic) CGFloat hm_width;
@property (nonatomic) CGFloat hm_height;

@end
