//
//  DateSugarTests.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HMObjcSugar.h"

@interface DateSugarTests : XCTestCase

@end

@implementation DateSugarTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testSingleton {
    XCTAssert([NSDate hm_sharedDateFormatter] == [NSDate hm_sharedDateFormatter], @"单例地址不一致");
    XCTAssert([NSDate hm_sharedCalendar] == [NSDate hm_sharedCalendar], @"单例地址不一致");
}

- (void)testDateStringWithDelta {
    
    [self checkDateStringWithDelta:24 * 60 * 60];
    [self checkDateStringWithDelta:-24 * 60 * 60];
    [self checkDateStringWithDelta:0];
    // TODO: - -69 年前就计算错误了！
    [self checkDateStringWithDelta:-68 * 365 * 24 * 60 * 60];
}

- (void)checkDateStringWithDelta:(NSTimeInterval)delta {
    NSString *dateString = [NSDate hm_dateStringWithDelta:delta];
    
    [NSDate hm_sharedDateFormatter].dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSDate *deltaDate = [NSDate dateWithTimeIntervalSinceNow:delta];
    NSString *checkString = [[NSDate hm_sharedDateFormatter] stringFromDate:deltaDate];
    
    NSLog(@"%@", dateString);
    
    XCTAssert([dateString isEqualToString:checkString], @"日期生成错误");
}

- (void)testDateDescription {
    
    XCTAssert([[NSDate dateWithTimeIntervalSinceNow:-59].hm_dateDescription isEqualToString:@"刚刚"]);
    XCTAssert([[NSDate dateWithTimeIntervalSinceNow:-10 * 60].hm_dateDescription isEqualToString:@"10 分钟前"]);
    XCTAssert([[NSDate dateWithTimeIntervalSinceNow:-1 * 60 * 60].hm_dateDescription isEqualToString:@"1 小时前"]);

    XCTAssert([NSDate dateWithTimeIntervalSinceNow:-24 * 60 * 60].hm_dateDescription.length == 11);
    XCTAssert([NSDate dateWithTimeIntervalSinceNow:-365 * 24 * 60 * 60].hm_dateDescription.length == 16);
}

@end
