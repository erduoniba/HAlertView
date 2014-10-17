//
//  HAlertView4.h
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "HAlertView.h"

@class FriendObj;

typedef void (^messageTap)(NSInteger tag, NSString *message);

@interface HAlertView4 : HAlertView <UITextFieldDelegate>

@property (nonatomic, strong) UITextField   *textField;
@property (nonatomic, copy) messageTap      handleMessage;

- (instancetype)initWithObject:(FriendObj *)rObj;

@end
