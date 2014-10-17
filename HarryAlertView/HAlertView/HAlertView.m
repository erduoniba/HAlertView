//
//  HAlertView.m
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "HAlertView.h"

@implementation HAlertView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.layer.cornerRadius = default_cornerRadius;
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}


- (void)alertViewShow{
    [self alertViewShowWithAnimation:0];
}

- (void)alertViewShowWithAnimation:(CGFloat)duration{
    [self alertViewShowWithAnimation:duration completion:Nil];
}

- (void)alertViewShowWithAnimation:(CGFloat)duration completion:(animtionTap)handleAnimation{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        if (handleAnimation) {
            handleAnimation(finished);
        }
    }];
}

- (void)alertViewHide{
    [self alertViewHideWithAnimation:0];
}

- (void)alertViewHideWithAnimation:(CGFloat)duration{
    [self alertViewHideWithAnimation:duration completion:Nil];
}

- (void)alertViewHideWithAnimation:(CGFloat)duration completion:(animtionTap)handleAnimation{
    [UIView animateWithDuration:duration animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (handleAnimation) {
            handleAnimation(finished);
        }
    }];
}


@end

@implementation UIView (Harry)

- (CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

@end
