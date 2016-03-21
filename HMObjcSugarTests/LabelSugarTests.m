//
//  LabelSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface LabelSugarTests : XCTestCase

@end

@implementation LabelSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCreateLabel {
    
    NSString *string = @"hello label";
    CGFloat fontSize = 14;
    UIColor *textColor = [UIColor hm_randomColor];
    
    UILabel *label = [UILabel hm_labelWithText:string fontSize:fontSize textColor:textColor];
    
    XCTAssert([label.text isEqualToString:string], @"文本不正确");
    XCTAssert(label.font.pointSize == fontSize, @"字体大小不正确");
    XCTAssert([label.textColor isEqual:textColor], @"颜色不正确");
    
    CGSize labelSize = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}
                                            context:nil].size;
    
    XCTAssert(ceil(labelSize.width) == ceil(label.bounds.size.width), @"宽度不正确");
    XCTAssert(ceil(labelSize.height) == ceil(label.bounds.size.height), @"高度不正确");
}

@end
