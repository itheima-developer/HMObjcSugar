//
//  NSString+HMObjcSugar.h
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HMPath)

/// 拼接了`文档目录`的全路径
@property (nullable, nonatomic, readonly) NSString *hm_documentDirectory;
/// 拼接了`缓存目录`的全路径
@property (nullable, nonatomic, readonly) NSString *hm_cacheDirecotry;
/// 拼接了临时目录的全路径
@property (nullable, nonatomic, readonly) NSString *hm_tmpDirectory;

@end

@interface NSString (HMBase64)

/// BASE 64 编码的字符串内容
@property(nullable, nonatomic, readonly) NSString *hm_base64encode;
/// BASE 64 解码的字符串内容
@property(nullable, nonatomic, readonly) NSString *hm_base64decode;

@end