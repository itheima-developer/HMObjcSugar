//
//  NSDate+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HMObjcSugar)

#pragma mark - 单例
+ (nonnull NSDateFormatter *)hm_sharedDateFormatter;
+ (nonnull NSCalendar *)hm_sharedCalendar;

#pragma mark - 日期方法
/// 返回指定时间差值的日期字符串
///
/// @param delta 时间差值
///
/// @return 日期字符串，格式：yyyy-MM-dd HH:mm:ss
+ (nonnull NSString *)hm_dateStringWithDelta:(NSTimeInterval)delta;

/// 返回日期格式字符串
///
/// 具体格式如下：
///     - 刚刚(一分钟内)
///     - X分钟前(一小时内)
///     - X小时前(当天)
///     - MM-dd HH:mm(一年内)
///     - yyyy-MM-dd HH:mm(更早期)
@property (nonnull, nonatomic, readonly) NSString *hm_dateDescription;

@end
