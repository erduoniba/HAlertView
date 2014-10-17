//
//  AdaptiveLabelView.m
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "AdaptiveLabelView.h"

#define default_label_height        30
#define default_label_distance      10
#define default_image_more_width    25  //图片宽度预留多文字多20

@implementation AdaptiveLabelView

- (instancetype)initWithFrame:(CGRect)frame andLabels:(NSArray *)labels{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat next_init_x = 0;
        CGFloat next_init_y = 0;
        
        for (int i=0; i<labels.count; i++) {
            CGSize textSize = [labels[i] sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(200, default_label_height) lineBreakMode:NSLineBreakByWordWrapping];

            UIImage *image = [UIImage imageNamed:@"label"];
            image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0, 21, 0, 21)];
            UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(next_init_x, next_init_y, textSize.width + default_image_more_width, default_label_height)];
            bgView.image = image;
            
            //新的label会超出view宽度，则显示在下一行
            if (bgView.frame.size.width + bgView.frame.origin.x > self.frame.size.width) {
                next_init_y += default_label_height + default_label_distance;
                next_init_x = 0;
                i--;
            }else{
                next_init_x += bgView.frame.size.width + default_label_distance;
                [self addSubview:bgView];
                
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, textSize.width, textSize.height)];
                label.text = labels[i];
                label.font = [UIFont systemFontOfSize:14];
                label.textColor = [UIColor whiteColor];
                [bgView addSubview:label];
            }
            
            self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, next_init_y + default_label_height);
        }
    }
    
    return self;
}

@end
