//
//  TextFieldSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/24.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface TextFieldSugarTests : XCTestCase

@end

@implementation TextFieldSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCreateTextField {
    
    NSString *placeHolder = @"请输入文本";
    UITextField *textField = [UITextField hm_textFieldWithPlaceHolder:placeHolder];
    
    XCTAssertNotNil(textField);
    XCTAssert([textField.placeholder isEqualToString:placeHolder]);
}

@end
