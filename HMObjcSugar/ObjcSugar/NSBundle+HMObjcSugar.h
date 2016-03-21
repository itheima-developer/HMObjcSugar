//
//  NSBundle+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (HMObjcSugar)

/// 当前版本号字符串
+ (nullable NSString *)hm_currentVersion;

/// 与当前屏幕尺寸匹配的启动图像
+ (nullable UIImage *)hm_launchImage;

@end
