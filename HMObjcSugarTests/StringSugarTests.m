//
//  StringSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface StringSugarTests : XCTestCase

@end

@implementation StringSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Path
- (void)testPathProperties {
    XCTAssert([@"hello.png".hm_documentDirectory containsString:@"/Documents/"]);
    XCTAssert([@"hello.png".hm_cacheDirecotry containsString:@"/Library/Caches/"]);
    XCTAssert([@"hello.png".hm_tmpDirectory containsString:@"/tmp/"]);
}

#pragma mark - BASE64
- (void)testBase64 {
    NSString *string = @"Use XCTAssert and related functions to verify your tests produce the correct results.";
    
    XCTAssert([string isEqualToString:string.hm_base64encode.hm_base64decode], @"BASE 64 编码解码错误");
    // $ echo -n "hello" | base64
    XCTAssert([@"hello".hm_base64encode isEqualToString:@"aGVsbG8="], @"BASE 64 编码错误");
    XCTAssert([@"aGVsbG8=".hm_base64decode isEqualToString:@"hello"], @"BASE 64 解码错误");
}

- (void)testPerformanceExample {
    
    NSMutableString *strM = [NSMutableString string];
    for (int i = 0; i < 10000; i++) {
        [strM appendString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"];
    }
    
    [self measureBlock:^{
        XCTAssert([strM isEqualToString:strM.hm_base64encode.hm_base64decode], @"BASE 64 编码解码错误");
    }];
}

@end
