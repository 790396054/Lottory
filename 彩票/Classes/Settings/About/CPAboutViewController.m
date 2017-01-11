//
//  CPAboutViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/11.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPAboutViewController.h"
#import "CPSettingsGroup.h"
#import "CPSettingsArrowItem.h"
#import "CPAboutHeaderView.h"

@interface CPAboutViewController ()

@end

@implementation CPAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup];
    self.tableView.tableHeaderView = [CPAboutHeaderView headerView];
}

-(void)addGroup{
    CPSettingsArrowItem *score = [CPSettingsArrowItem itemWithTitle:@"评分支持" icon:nil];
    score.option = ^{
        NSString *appid = @"1168572542";
        NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/id%@?mt=8",appid];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    };
    CPSettingsArrowItem *phone = [CPSettingsArrowItem itemWithTitle:@"客服电话" icon:nil];
    phone.subTitle = @"020-828336956";
    phone.option = ^{
        NSString *url = [NSString stringWithFormat:@"tel://02082333985"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    };
    
    CPSettingsGroup *group = [[CPSettingsGroup alloc] init];
    group.item = @[score, phone];
    [self.dataList addObject:group];
}

@end
