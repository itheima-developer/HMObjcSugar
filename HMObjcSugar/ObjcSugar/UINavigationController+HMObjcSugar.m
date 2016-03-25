//
//  UINavigationController+HMObjcSugar.m
//  HMObjcSugar
//
//  Created by 刘凡 on 16/3/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UINavigationController+HMObjcSugar.h"
#import <objc/runtime.h>

@interface HMFullScreenPopGestureRecognizerDelegate : NSObject <UIGestureRecognizerDelegate>

@property (nonatomic, weak) UINavigationController *navigationController;

@end

@implementation HMFullScreenPopGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    
    if (self.navigationController.viewControllers.count <= 1) {
        return NO;
    }
    
    if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    
    return YES;
}

@end

@implementation UINavigationController (HMObjcSugar)

+ (void)load {
    
    Method originalMethod = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
    Method swizzledMethod = class_getInstanceMethod([self class], @selector(hm_pushViewController:animated:));
    
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

- (void)hm_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.hm_popGestureRecognizer]) {
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.hm_popGestureRecognizer];
        
        NSArray *targets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
        id internalTarget = [targets.firstObject valueForKey:@"target"];
        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
        
        self.hm_popGestureRecognizer.delegate = [self hm_fullScreenPopGestureRecognizerDelegate];
        [self.hm_popGestureRecognizer addTarget:internalTarget action:internalAction];
        
        // 禁用系统的交互手势
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    
    if (![self.viewControllers containsObject:viewController]) {
        [self hm_pushViewController:viewController animated:animated];
    }
}

- (HMFullScreenPopGestureRecognizerDelegate *)hm_fullScreenPopGestureRecognizerDelegate {
    HMFullScreenPopGestureRecognizerDelegate *delegate = objc_getAssociatedObject(self, _cmd);
    if (!delegate) {
        delegate = [[HMFullScreenPopGestureRecognizerDelegate alloc] init];
        delegate.navigationController = self;
        
        objc_setAssociatedObject(self, _cmd, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return delegate;
}

- (UIPanGestureRecognizer *)hm_popGestureRecognizer {
    UIPanGestureRecognizer *panGestureRecognizer = objc_getAssociatedObject(self, _cmd);
    
    if (panGestureRecognizer == nil) {
        panGestureRecognizer = [[UIPanGestureRecognizer alloc] init];
        panGestureRecognizer.maximumNumberOfTouches = 1;
        
        objc_setAssociatedObject(self, _cmd, panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return panGestureRecognizer;
}

@end
