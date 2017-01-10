//
//  CPPushTableViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPPushTableViewController.h"
#import "CPSettingsGroup.h"
#import "CPSettingsArrowItem.h"
#import "CPTestViewController.h"
#import "CPPushNoticeViewController.h"

@interface CPPushTableViewController ()

@end

@implementation CPPushTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 添加第0组
    [self.dataList addObject:[self addGroup0]];
}

// 添加第0组
-(CPSettingsGroup *)addGroup0{
    CPSettingsGroup *group0 = [[CPSettingsGroup alloc] init];
    CPSettingsItem *lottoryNumber = [CPSettingsArrowItem itemWithTitle:@"开奖号码推送" icon:nil destVcCalss:[CPTestViewController class]];
    CPSettingsItem *anim = [CPSettingsArrowItem itemWithTitle:@"中奖动画" icon:nil destVcCalss:[CPTestViewController class]];
    CPSettingsItem *scott = [CPSettingsArrowItem itemWithTitle:@"比分直播提醒" icon:nil destVcCalss:[CPPushNoticeViewController class]];
    CPSettingsItem *buy = [CPSettingsArrowItem itemWithTitle:@"购彩定时提醒" icon:nil destVcCalss:[CPTestViewController class]];
    group0.item = @[lottoryNumber, anim, scott, buy];
    return group0;
}
@end
