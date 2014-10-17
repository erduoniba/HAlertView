//
//  AdaptiveLabelView.h
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdaptiveLabelView : UIView

/**
 *  自动生成label界面
 *
 *  @param frame  frame的frame.origin.x , frame.origin.y , frame.size.width 会保持不变，高度由labels的个数及长度自动生成
 *  @param labels 要显示的label数组
 *
 *  @return 生成label界面
 */
- (instancetype)initWithFrame:(CGRect)frame andLabels:(NSArray *)labels;

@end
