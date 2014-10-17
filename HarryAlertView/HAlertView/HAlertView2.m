//
//  HAlertView2.m
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "HAlertView2.h"

@implementation HAlertView2

- (instancetype)initHeaderView:(UIView *)headerView
                      andClose:(NSString *)close
                     andOthers:(NSArray *)others{
    self = [super init];
    if (self) {
        CGFloat adaptiveHeight = 50 + headerView.frame.size.height + (others.count + 1) * 44;
        self.frame = CGRectMake(HAV_Init_X, (Main_Size.height - adaptiveHeight) / 2, Main_Size.width - HAV_Init_X * 2, adaptiveHeight);
        
        headerView.frame = CGRectMake((self.frame.size.width - headerView.frame.size.width) / 2,
                                      25,
                                      headerView.frame.size.width,
                                      headerView.frame.size.height);
        [self addSubview:headerView];
        
        CGFloat init_y = 50 + headerView.frame.size.height;
        for (int i=0; i<others.count + 1; i++) {
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, init_y, Main_Size.width - HAV_Init_X * 2, 0.5)];
            line.backgroundColor = default_line_color;
            [self addSubview:line];
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(0, init_y + 0.5, Main_Size.width - HAV_Init_X * 2, 44);
            button.tag = i;
            button.titleLabel.font = [UIFont systemFontOfSize:16];
            [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            
            if (i == others.count) {
                [button setTitle:close forState:UIControlStateNormal];
                [button setTitle:close forState:UIControlStateHighlighted];
                [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
            }else{
                [button setTitle:others[i] forState:UIControlStateNormal];
                [button setTitle:others[i] forState:UIControlStateHighlighted];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
            }
            
            init_y += 44.5;
        }
    }
    
    return self;
}

- (void)buttonTap:(UIButton *)button{
    if (self.handleButton) {
        self.handleButton(button.tag);
    }
}

@end
