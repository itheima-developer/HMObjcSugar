//
//  UIView+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIView+HMObjcSugar.h"

@implementation UIView (HMObjcSugar)

#pragma mark - Frame
- (CGPoint)hm_viewOrigin {
    return self.frame.origin;
}

- (void)setHm_viewOrigin:(CGPoint)hm_viewOrigin {
    CGRect newFrame = self.frame;
    newFrame.origin = hm_viewOrigin;
    self.frame = newFrame;
}

- (CGSize)hm_viewSize {
    return self.frame.size;
}

- (void)setHm_viewSize:(CGSize)hm_viewSize {
    CGRect newFrame = self.frame;
    newFrame.size = hm_viewSize;
    self.frame = newFrame;
}

#pragma mark - Frame Origin
- (CGFloat)hm_x {
    return self.frame.origin.x;
}

- (void)setHm_x:(CGFloat)hm_x {
    CGRect newFrame = self.frame;
    newFrame.origin.x = hm_x;
    self.frame = newFrame;
}

- (CGFloat)hm_y {
    return self.frame.origin.y;
}

- (void)setHm_y:(CGFloat)hm_y {
    CGRect newFrame = self.frame;
    newFrame.origin.y = hm_y;
    self.frame = newFrame;
}

#pragma mark - Frame Size
- (CGFloat)hm_width {
    return self.frame.size.width;
}

- (void)setHm_width:(CGFloat)hm_width {
    CGRect newFrame = self.frame;
    newFrame.size.width = hm_width;
    self.frame = newFrame;
}

- (CGFloat)hm_height {
    return self.frame.size.height;
}

- (void)setHm_height:(CGFloat)hm_height {
    CGRect newFrame = self.frame;
    newFrame.size.height = hm_height;
    self.frame = newFrame;
}

#pragma mark - 截屏
- (UIImage *)hm_capturedImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);
    
    UIImage *result = nil;
    if ([self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES]) {
        result = UIGraphicsGetImageFromCurrentImageContext();
    }
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
