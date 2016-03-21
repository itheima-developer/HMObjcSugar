//
//  BundleSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface BundleSugarTests : XCTestCase

@end

@implementation BundleSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCurrentVersion {
    NSString *versionString = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    
    XCTAssert([[NSBundle hm_currentVersion] isEqualToString:versionString], @"版本不正确");
}

- (void)testLaunchImage {
    UIImage *image = [NSBundle hm_launchImage];
    
    XCTAssert(image != nil, @"无法找到匹配的启动图片");
    XCTAssert(CGSizeEqualToSize(image.size, [UIScreen mainScreen].bounds.size), @"启动图片尺寸不正确");
}

@end
