//
//  HAlertView4.m
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "HAlertView4.h"

#import "AdaptiveLabelView.h"

#import "FriendObj.h"

@implementation HAlertView4

- (instancetype)initWithObject:(FriendObj *)rObj{
    self = [super init];
    if (self) {
        
        self.frame = CGRectMake(HAV_Init_X, 100, Main_Size.width - HAV_Init_X * 2, 300);
        
        UIImage *image = [UIImage imageNamed:rObj.fo_headerImage];
        UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(16,
                                                                                (54 - image.size.height)/2,
                                                                                image.size.width,
                                                                                image.size.height)];
        headerView.image = image;
        [self addSubview:headerView];
        
        UILabel *nickNameLb = [[UILabel alloc] initWithFrame:CGRectMake(headerView.right + 16, 10, 200, 17)];
        nickNameLb.text = rObj.fo_niceName;
        nickNameLb.font = [UIFont systemFontOfSize:16];
        [self addSubview:nickNameLb];
        
        UILabel *distanceLb = [[UILabel alloc] initWithFrame:CGRectMake(headerView.right + 16, nickNameLb.bottom + 6, 200, 13)];
        distanceLb.text = rObj.fo_distance;
        distanceLb.font = [UIFont systemFontOfSize:12];
        distanceLb.textColor = [UIColor grayColor];
        [self addSubview:distanceLb];
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 54, self.frame.size.width, 0.5)];
        line.backgroundColor = default_line_color;
        [self addSubview:line];
        
        AdaptiveLabelView *labelView = [[AdaptiveLabelView alloc] initWithFrame:CGRectMake(16, line.bottom + 15, self.frame.size.width - 32, 200) andLabels:rObj.fo_labels];
        [self addSubview:labelView];
        
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(16, labelView.bottom + 15, self.frame.size.width - 32, 50)];
        _textField.font = [UIFont systemFontOfSize:14];
        [_textField setBorderStyle:UITextBorderStyleRoundedRect];
        _textField.delegate = self;
        [self addSubview:_textField];
        
        UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(0, _textField.bottom + 15, self.frame.size.width, 0.5)];
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
        
        self.frame = CGRectMake(HAV_Init_X, (Main_Size.height - button.bottom) / 2, Main_Size.width - HAV_Init_X * 2, button.bottom);
    }
    
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)buttonTap:(UIButton *)button{
    if (_handleMessage) {
        _handleMessage(button.tag, _textField.text);
    }
}

@end
