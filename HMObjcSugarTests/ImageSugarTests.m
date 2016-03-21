//
//  ImageSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface ImageSugarTests : XCTestCase

@end

@implementation ImageSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSingleDotImage {
    UIImage *image = [UIImage hm_singleDotImageWithColor:[UIColor hm_randomColor]];
    
    XCTAssert(CGSizeEqualToSize(image.size, CGSizeMake(1, 1)), @"图像尺寸不正确");
    XCTAssert(image.scale == [UIScreen hm_scale], @"图像分辨率不正确");
}

- (void)testSingleDotImagePerformance {
    [self measureBlock:^{
        for (int i = 0; i < 10; i++) {
            [UIImage hm_singleDotImageWithColor:[UIColor hm_randomColor]];
        }
    }];
}

@end
