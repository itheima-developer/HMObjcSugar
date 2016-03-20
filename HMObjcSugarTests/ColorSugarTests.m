//
//  ColorSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface ColorSugarTests : XCTestCase

@end

@implementation ColorSugarTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - 测试创建颜色
- (void)testColorWithRGB {
    XCTAssert([[UIColor hm_colorWithRed:255 green:0 blue:0] isEqual:[UIColor redColor]], @"颜色错误");
    XCTAssert([[UIColor hm_colorWithRed:0 green:255 blue:0] isEqual:[UIColor greenColor]], @"颜色错误");
    XCTAssert([[UIColor hm_colorWithRed:0 green:0 blue:255] isEqual:[UIColor blueColor]], @"颜色错误");
}

- (void)testColorWithHEX {
    XCTAssert([[UIColor hm_colorWithHex:0xFF0000] isEqual:[UIColor redColor]], @"颜色错误");
    XCTAssert([[UIColor hm_colorWithHex:0x00FF00]  isEqual:[UIColor greenColor]], @"颜色错误");
    XCTAssert([[UIColor hm_colorWithHex:0x0000FF] isEqual:[UIColor blueColor]], @"颜色错误");
}

- (void)testRandomColor {
    XCTAssertNotNil([UIColor hm_randomColor], @"创建颜色错误");
}

#pragma mark - 测试颜色值
- (void)testColorValue {

    UIColor *color = [UIColor hm_colorWithHex:0xFF0000];
    XCTAssert(color.hm_redValue == 255 && color.hm_greenValue == 0 && color.hm_blueValue == 0 && color.hm_alphaValue == 1.0);
    
    u_int8_t r = arc4random_uniform(256);
    u_int8_t g = arc4random_uniform(256);
    u_int8_t b = arc4random_uniform(256);
    
    UIColor *randomColor = [UIColor hm_colorWithRed:r green:g blue:b];
    XCTAssert(randomColor.hm_redValue == r && randomColor.hm_greenValue == g && randomColor.hm_blueValue == b && color.hm_alphaValue == 1.0);
}

@end
