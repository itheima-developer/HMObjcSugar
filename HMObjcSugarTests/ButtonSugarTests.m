//
//  ButtonSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface ButtonSugarTests : XCTestCase

@end

@implementation ButtonSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testCreateImageButton {
    
    NSString *imageName = @"tabbar_compose_icon_add";
    NSString *backImageName = @"tabbar_compose_button";
    NSString *suffix = @"_highlighted";
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *backImage = [UIImage imageNamed:backImageName];
    
    // --- 测试图像按钮 ---
    {
        UIButton *button = [UIButton hm_buttonWithImageName:imageName highlightSuffix:suffix];
        
        XCTAssert(CGSizeEqualToSize(button.bounds.size, image.size), @"按钮尺寸错误");
    }
    // --- 测试 图像 & 背景图像 按钮 ---
    {
        UIButton *button = [UIButton hm_buttonWithImageName:imageName backImageName:backImageName highlightSuffix:suffix];
        
        XCTAssert(CGSizeEqualToSize(button.bounds.size, backImage.size), @"按钮尺寸错误");
    }
}

- (void)testCreateTextButton {
    
    NSString *title = @"hello button";
    CGFloat fontSize = 17;
    UIColor *textColor = [UIColor hm_randomColor];
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]
                                          initWithString:title
                                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                                                       NSForegroundColorAttributeName: textColor}];
    CGSize size = [attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil].size;
    
    // --- 测试文本按钮 ---
    {
        UIButton *button = [UIButton hm_buttonWithTitle:title fontSize:fontSize textColor:textColor];
        
        XCTAssert(button.bounds.size.width == ceil(size.width), @"宽度不正确");
    }
    
    // --- 测试属性文本按钮 ---
    {
        UIButton *button = [UIButton hm_buttonWithAttributedText:attributedText];
        
        XCTAssert(button.bounds.size.width == ceil(size.width), @"宽度不正确");
    }
}

- (void)testCreateTextImageButton {
    NSString *title = @"hello button";
    CGFloat fontSize = 17;
    UIColor *textColor = [UIColor hm_randomColor];
    
    NSAttributedString *attributedText = [[NSAttributedString alloc]
                                          initWithString:title
                                          attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize],
                                                       NSForegroundColorAttributeName: textColor}];
    CGSize size = [attributedText boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT)
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil].size;
    
    NSString *backImageName = @"tabbar_compose_button";
    NSString *suffix = @"_highlighted";
    
    // --- 测试文本背景图像按钮 ---
    {
        UIButton *button = [UIButton hm_buttonWithTitle:title fontSize:fontSize textColor:textColor imageName:nil backImageName:backImageName highlightSuffix:suffix];
        
        XCTAssert(button.bounds.size.width == ceil(size.width), @"宽度不正确");
    }
    
    // --- 测试属性文本背景图像按钮 ---
    {
        UIButton *button = [UIButton hm_buttonWithAttributedText:attributedText imageName:nil backImageName:backImageName highlightSuffix:suffix];
        
        XCTAssert(button.bounds.size.width == ceil(size.width), @"宽度不正确");
    }
}

@end
