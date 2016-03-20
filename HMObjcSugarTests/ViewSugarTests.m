//
//  ViewSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface ViewSugarTests : XCTestCase

@end

@implementation ViewSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - 测试 Frame
- (void)testOriginSize {
    UIView *view = [[UIView alloc] init];
    
    CGPoint origin = CGPointMake(arc4random_uniform(100), arc4random_uniform(100));
    CGSize size = CGSizeMake(arc4random_uniform(300), arc4random_uniform(300));
    CGRect rect = (CGRect) { .origin = origin, .size = size };
    
    view.hm_viewOrigin = origin;
    view.hm_viewSize = size;
    
    [self checkViewFrame:view withRect:rect];
}

- (void)testXYWidthHeight {
    
    UIView *view = [[UIView alloc] init];
    
    CGFloat x = arc4random_uniform(100);
    CGFloat y = arc4random_uniform(100);
    CGFloat w = arc4random_uniform(300);
    CGFloat h = arc4random_uniform(600);
    
    view.hm_x = x;
    view.hm_y = y;
    view.hm_width = w;
    view.hm_height = h;
    
    [self checkViewFrame:view withRect:CGRectMake(x, y, w, h)];
}

- (void)checkViewFrame:(UIView *)view withRect:(CGRect)rect {
    
    XCTAssert(rect.origin.x == view.hm_x, @"x 不一致");
    XCTAssert(rect.origin.y == view.hm_y, @"y 不一致");
    XCTAssert(rect.size.width == view.hm_width, @"width 不一致");
    XCTAssert(rect.size.height == view.hm_height, @"height 不一致");
    
    XCTAssert(CGPointEqualToPoint(rect.origin, view.hm_viewOrigin), @"原点不一致");
    XCTAssert(CGSizeEqualToSize(rect.size, view.hm_viewSize), @"尺寸不一致");
    XCTAssert(CGRectEqualToRect(rect, view.frame), @"frame 不一致");
}

- (void)testCapturedImage {
    
    CGFloat w = arc4random_uniform([UIScreen hm_screenWidth]);
    CGFloat h = arc4random_uniform([UIScreen hm_screenHeight]);
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
    UIImage *image = [view hm_capturedImage];
    
    XCTAssert(CGSizeEqualToSize(image.size, CGSizeMake(w, h)), @"图像尺寸错误");
}

- (void)testCapturedImagePerformance {
    
    [self measureBlock:^{
        CGFloat w = arc4random_uniform([UIScreen hm_screenWidth]);
        CGFloat h = arc4random_uniform([UIScreen hm_screenHeight]);
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
        view.backgroundColor = [UIColor hm_randomColor];
        
        [view hm_capturedImage];
    }];
}

@end
