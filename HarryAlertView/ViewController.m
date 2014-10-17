//
//  ViewController.m
//  HarryAlertView
//
//  Created by Harry on 14-10-16.
//  Copyright (c) 2014年 Harry. All rights reserved.
//

#import "ViewController.h"

#import "HAlertView1.h"
#import "HAlertView2.h"
#import "HAlertView3.h"
#import "HAlertView4.h"
#import "AdaptiveLabelView.h"

#import "FriendObj.h"

@interface ViewController ()
{
    HAlertView1 *haView1;
    HAlertView2 *haView2;
    HAlertView3 *haView3;
    HAlertView3 *haView4;
    HAlertView4 *haView5;
    
    AdaptiveLabelView   *labelView;
}
@property (weak, nonatomic) IBOutlet UILabel *messageLb;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.6];
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg1"]];
}

- (IBAction)touchTap:(UIButton *)sender {
    
    __block typeof(self) block_self = self;

    switch (sender.tag) {
        case 0:
        {
            if (haView1 == nil) {
                haView1 = [[HAlertView1 alloc] init];
                haView1.handleButton = ^(NSInteger tag){
                    NSLog(@"点击haView1 第 %d 个icon ", (int)tag);
                    block_self.messageLb.text = [NSString stringWithFormat:@"点击haView1 第 %d 个icon ", (int)tag];
                    [block_self->haView1 alertViewHideWithAnimation:default_duration];
                };
                [self.view addSubview:haView1];
            }
            
            [self.view bringSubviewToFront:haView1];
            [haView1 alertViewShowWithAnimation:default_duration];
        }
            break;
            
        case 1:
        {
            if(haView2 == nil){
                NSString *close = @"关闭";
                NSArray *others = @[@"修改", @"删除", @"添加好友", @"查看关联标签"];
                UIImage *image = [UIImage imageNamed:@"header"];
                UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
                headerView.image = image;
                haView2 = [[HAlertView2 alloc] initHeaderView:headerView andClose:close andOthers:others];
                haView2.handleButton = ^(NSInteger tag){
                    if (tag < others.count) {
                        NSLog(@"点击haView2 %@ 按钮", others[tag]);
                        block_self.messageLb.text = [NSString stringWithFormat:@"点击haView2 %@ 按钮", others[tag]];
                    }else{
                        NSLog(@"点击haView2 %@ 按钮", close);
                        block_self.messageLb.text = [NSString stringWithFormat:@"点击haView2 %@ 按钮", close];
                    }
                    [block_self->haView2 alertViewHideWithAnimation:default_duration];
                    
                };
                [self.view addSubview:haView2];
            }
            
            [self.view bringSubviewToFront:haView2];
            [haView2 alertViewShowWithAnimation:default_duration];
        }
            break;
            
        case 2:
        {
            if(haView3 == nil){
                NSString *title = @"以签会友";
                NSString *content = @"  选择一些您感兴趣的标签，您可以搜索到同时满足所选标签的人。";
                UIImage *image = [UIImage imageNamed:@"header"];
                UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
                headerView.image = image;
                haView3 = [[HAlertView3 alloc] initHeaderView:headerView andTitle:title andContent:content];
                haView3.handleButton = ^(NSInteger tag){
                    
                    if (tag == HAlertView_Cannel) {
                        NSLog(@"点击haView3 取消 按钮");
                        block_self.messageLb.text = @"点击haView3 取消 按钮";
                    }else if(tag == HAlertView_Sure){
                        NSLog(@"点击haView3 确定 按钮");
                        block_self.messageLb.text = @"点击haView3 确定 按钮";
                    }
                    [block_self->haView3 alertViewHideWithAnimation:default_duration];
                };
                [self.view addSubview:haView3];
            }
            
            [self.view bringSubviewToFront:haView3];
            [haView3 alertViewShowWithAnimation:default_duration];
        }
            break;
            
        case 3:
        {
            if(haView4 == nil){
                NSString *content = @"  对不起，您需要补充您的地区、年龄、星座、学校的信息后，才能使用优先卡功能";
                haView4 = [[HAlertView3 alloc] initHeaderView:nil andTitle:nil andContent:content];
                haView4.handleButton = ^(NSInteger tag){
                    
                    if (tag == HAlertView_Cannel) {
                        NSLog(@"点击haView4 取消 按钮");
                        block_self.messageLb.text = @"点击haView4 取消 按钮";
                    }else if(tag == HAlertView_Sure){
                        NSLog(@"点击haView4 确定 按钮");
                        block_self.messageLb.text = @"点击haView4 确定 按钮";
                    }
                    [block_self->haView4 alertViewHideWithAnimation:default_duration];
                };
                [self.view addSubview:haView4];
            }
            
            [self.view bringSubviewToFront:haView4];
            [haView4 alertViewShowWithAnimation:default_duration];
        }
            break;
            
        case 4:
        {
            if(haView5 == nil){
                FriendObj *fObj = [[FriendObj alloc] init];
                fObj.fo_headerImage = @"header";
                fObj.fo_distance = @"865米";
                fObj.fo_niceName = @"丫丫";
                fObj.fo_labels = @[@"NB", @"欧冠", @"夜猫子", @"跑", @"组团旅游", @"游泳", @"NBA", @"欧冠", @"夜猫子", @"组团旅游", @"游泳"];
                haView5 = [[HAlertView4 alloc] initWithObject:fObj];
                haView5.handleMessage = ^(NSInteger tag, NSString *message){
                    
                    if (tag == HAlertView_Cannel) {
                        NSLog(@"点击haView5 取消 按钮");
                        block_self.messageLb.text = @"点击haView5 取消 按钮";
                    }else if(tag == HAlertView_Sure){
                        NSLog(@"点击haView5 确定 按钮, 输入的消息是:%@", message);
                        block_self.messageLb.text = [NSString stringWithFormat:@"点击haView5 确定 按钮, 输入的消息是:%@", message];
                    }
                    [block_self->haView5 alertViewHideWithAnimation:default_duration];
                };
                [self.view addSubview:haView5];
            }
            
            [self.view bringSubviewToFront:haView5];
            [haView5 alertViewShowWithAnimation:default_duration];
        }
            break;
            
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
