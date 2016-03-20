//
//  ScreenSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface ScreenSugarTests : XCTestCase

@end

@implementation ScreenSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testScreenInfo {
    CGFloat screenWidth = [UIScreen hm_screenWidth];
    CGFloat screenHeight = [UIScreen hm_screenHeight];
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    XCTAssert(CGSizeEqualToSize(screenSize, CGSizeMake(screenWidth, screenHeight)), @"屏幕尺寸错误");
    
    CGFloat screenScale = [UIScreen mainScreen].nativeScale;
    XCTAssert(screenScale == [UIScreen hm_scale], @"屏幕分辨率错误");
}

@end
