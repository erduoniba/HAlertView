//
//  HAlertView2.h
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "HAlertView.h"

typedef void (^ buttonTap)(NSInteger tag);

@interface HAlertView2 : HAlertView

- (instancetype)initHeaderView:(UIView *)headerView
                      andClose:(NSString *)close
                     andOthers:(NSArray *)others;

@end
