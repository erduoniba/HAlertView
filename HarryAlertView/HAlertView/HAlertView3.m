//
//  HAlertView3.m
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "HAlertView3.h"

#define Main_Size      ([[UIScreen mainScreen] bounds].size)

@implementation HAlertView3

- (instancetype)initHeaderView:(UIView *)headerView
                      andTitle:(NSString *)title
                    andContent:(NSString *)content{
    
    self = [super init];
    if (self) {
        
        CGSize textSize = [content sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(Main_Size.width - HAV_Init_X * 2 - 32, 999) lineBreakMode:NSLineBreakByWordWrapping];
        CGFloat adaptiveHeight = 54 + 50 + textSize.height + 44;
        self.frame = CGRectMake(HAV_Init_X, (Main_Size.height - adaptiveHeight) / 2, Main_Size.width - HAV_Init_X * 2, adaptiveHeight);
        CGFloat contentInitY = 0;
        
        if (headerView && title) {
            headerView.frame = CGRectMake(16,
                                          (54 - headerView.frame.size.height) / 2,
                                          headerView.frame.size.width,
                                          headerView.frame.size.height);
            [self addSubview:headerView];
            
            UILabel *titleLb = [[UILabel alloc] initWithFrame:CGRectMake(80, 15, self.frame.size.width - 160, 24)];
            titleLb.font = [UIFont systemFontOfSize:16];
            titleLb.text = title;
            titleLb.textAlignment = NSTextAlignmentCenter;
            [self addSubview:titleLb];
            
            UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(0, 54, self.frame.size.width, 0.5)];
            line1.backgroundColor = default_line_color;
            [self addSubview:line1];
            
            contentInitY = line1.bottom + 25;
        }else{
            adaptiveHeight = 50 + textSize.height + 44;
            contentInitY = 25;
        }
        
        self.frame = CGRectMake(HAV_Init_X, (Main_Size.height - adaptiveHeight) / 2, Main_Size.width - HAV_Init_X * 2, adaptiveHeight);
        
        UILabel *contentLb = [[UILabel alloc] initWithFrame:CGRectMake(16, contentInitY, self.frame.size.width - 32, textSize.height)];
        contentLb.font = [UIFont systemFontOfSize:14];
        contentLb.text = content;
        contentLb.numberOfLines = 0;
        [self addSubview:contentLb];
        
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, 25 + contentLb.bottom, self.frame.size.width, 0.5)];
        line2.backgroundColor = default_line_color;
        [self addSubview:line2];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, line2.bottom, self.frame.size.width / 2, 44);
        button.tag = HAlertView_Cannel;
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitle:@"取消" forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width / 2, line2.bottom, 0.5, 44)];
        line3.backgroundColor = default_line_color;
        [self addSubview:line3];
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(self.frame.size.width / 2 + 0.5, line2.bottom, self.frame.size.width / 2, 44);
        button2.tag = HAlertView_Sure;
        button2.titleLabel.font = [UIFont systemFontOfSize:16];
        [button2 setTitle:@"确定" forState:UIControlStateNormal];
        [button2 setTitle:@"确定" forState:UIControlStateHighlighted];
        [button2 setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        [button2 addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button2];
    }
    
    return self;
}

- (void)buttonTap:(UIButton *)button{
    if (self.handleButton) {
        self.handleButton(button.tag);
    }
}

@end
