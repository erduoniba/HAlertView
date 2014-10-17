//
//  HAlertView.h
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

#define Main_Size               ([[UIScreen mainScreen] bounds].size)
#define HAV_Init_X              18

#define default_cornerRadius    6

#define default_duration        0.3


#define default_line_color      [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1]


typedef void (^ animtionTap)(BOOL finished);
typedef void (^ buttonTap)(NSInteger tag);

typedef NS_ENUM(NSInteger, HAlertView_Type){
    HAlertView_Cannel = 0,
    HAlertView_Sure,
};

@interface HAlertView : UIView

@property (nonatomic, copy) buttonTap     handleButton;

- (void)alertViewShow;
- (void)alertViewShowWithAnimation:(CGFloat)duration;
- (void)alertViewShowWithAnimation:(CGFloat)duration completion:(animtionTap)handleAnimation;

- (void)alertViewHide;
- (void)alertViewHideWithAnimation:(CGFloat)duration;
- (void)alertViewHideWithAnimation:(CGFloat)duration completion:(animtionTap)handleAnimation;

@end

@interface UIView (Harry)

- (CGFloat)bottom;
- (CGFloat)right;

@end
