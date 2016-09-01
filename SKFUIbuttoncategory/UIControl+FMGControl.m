//
//  UIControl+FMGControl.m
//  HaoJiXingDayi
//
//  Created by 孙凯峰 on 16/8/10.
//  Copyright © 2016年 Kevin Sun. All rights reserved.
//

#import "UIControl+FMGControl.h"
#import <objc/runtime.h>
static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

@implementation UIControl (FMGControl)
- (NSTimeInterval)acceptEventInterval
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}


- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)FMG_ignoreEvent
{
    return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];
}

+ (void)load
{
    Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method b = class_getInstanceMethod(self, @selector(FMG_sendAction:to:froEvent:));
    
    method_exchangeImplementations(a, b);
}

- (void)FMG_sendAction:(SEL)action to:(id)target froEvent:(UIEvent *)event
{
    if (self.acceptEventInterval > 0) {
        if (self.userInteractionEnabled) {
            
            [self FMG_sendAction:action to:target froEvent:event];
        }
        self.userInteractionEnabled = NO;
        
        [self performSelector:@selector(setUserInteractionEnabled:) withObject:@(YES) afterDelay:self.acceptEventInterval];
        
        
        // GCD 延迟执行 self.acceptEventInterval：为延迟时间
        __weak typeof (self) weakSelf = self;
        dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.acceptEventInterval * NSEC_PER_SEC));
        
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            weakSelf.userInteractionEnabled = YES;
        });
        
        
        
    } else {
        [self FMG_sendAction:action to:target froEvent:event];
    }
    
}

@end
