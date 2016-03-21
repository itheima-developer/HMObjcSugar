//
//  NSBundle+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "NSBundle+HMObjcSugar.h"

@implementation NSBundle (HMObjcSugar)

+ (NSString *)hm_currentVersion {
    return [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
}

+ (UIImage *)hm_launchImage {
    
    NSArray *launchImages = [NSBundle mainBundle].infoDictionary[@"UILaunchImages"];
    
    NSString *sizeString = NSStringFromCGSize([UIScreen mainScreen].bounds.size);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"UILaunchImageOrientation = 'Portrait' AND UILaunchImageSize = %@", sizeString];
    NSArray *result = [launchImages filteredArrayUsingPredicate:predicate];
    
    NSString *imageName = result.lastObject[@"UILaunchImageName"];
    
    return [UIImage imageNamed:imageName];
}

@end
