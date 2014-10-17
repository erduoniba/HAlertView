//
//  HAlertView1.m
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "HAlertView1.h"

#define Default_Size   CGSizeMake(300, 300)

@implementation HAlertView1

- (instancetype)init{
    return [self initWithPostion:CGPointMake((Main_Size.width - Default_Size.width) / 2, (Main_Size.height - Default_Size.height) / 2)];
}

- (instancetype)initWithPostion:(CGPoint )startPoint{
    self = [super init];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"HAlertView1" owner:nil options:nil] lastObject];
        self.frame = CGRectMake(startPoint.x, startPoint.y, Default_Size.width, Default_Size.height);
        self.layer.cornerRadius = default_cornerRadius;
    }
    
    return self;
}

- (IBAction)itemTap:(UIButton *)sender {
    if (self.handleButton) {
        self.handleButton(sender.tag);
    }
}


@end
