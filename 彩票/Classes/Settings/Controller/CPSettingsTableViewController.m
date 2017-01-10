//
//  CPSettingsTableViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/9.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPSettingsTableViewController.h"
#import "CPSettingsItem.h"
#import "CPSettingsGroup.h"
#import "CPSettingsArrowItem.h"
#import "CPSettingsSwitchItem.h"
#import "CPTestTableViewController.h"
#import "MBProgressHUD+MJ.h"
#import "CPProductCollectionViewController.h"
#import "CPPushTableViewController.h"

@interface CPSettingsTableViewController ()

@end

@implementation CPSettingsTableViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    // 添加第0组
    [self.dataList addObject: [self addGroup0]];
    // 添加第1组
    [self.dataList addObject:[self addGroup1]];
}

// 添加第0组
-(CPSettingsGroup *)addGroup0{
    // 第0组
    CPSettingsGroup *group0 = [[CPSettingsGroup alloc] init];
    CPSettingsItem *morePush = [CPSettingsArrowItem itemWithTitle:@"推送和提醒" icon:@"MorePush" destVcCalss:[CPPushTableViewController class]];
    CPSettingsItem *handShake = [CPSettingsSwitchItem itemWithTitle:@"摇一摇机选" icon:@"handShake"];
    CPSettingsItem *soundEffect = [CPSettingsSwitchItem itemWithTitle:@"声音效果" icon:@"sound_Effect"];
    group0.item = @[morePush, handShake, soundEffect];
    return group0;
}

// 添加第1组
-(CPSettingsGroup *)addGroup1{
    // 第一组
    CPSettingsGroup *group1 = [[CPSettingsGroup alloc] init];
    CPSettingsItem *moreUpdate = [CPSettingsArrowItem itemWithTitle:@"检查新版本" icon:@"MoreUpdate"];
    CPSettingsItem *moreHelp = [CPSettingsArrowItem itemWithTitle:@"帮助" icon:@"MoreHelp" destVcCalss:[CPTestTableViewController class]];
    // 保存一段检测更新的代码
    moreUpdate.option = ^{
        // 显示蒙版
        [MBProgressHUD showMessage:@"正在检测更新中。。。"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 隐藏蒙版
            [MBProgressHUD hideHUD];
            // 弹出提醒
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"有新版本2.2" message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"立即更新", nil];
            [alert show];
        });
    };
    CPSettingsItem *moreShare = [CPSettingsItem itemWithTitle:@"分享" icon:@"MoreShare"];
    CPSettingsItem *moreMessage = [CPSettingsItem itemWithTitle:@"查看消息" icon:@"MoreMessage"];
    CPSettingsItem *moreNetease = [CPSettingsArrowItem itemWithTitle:@"产品推荐" icon:@"MoreNetease" destVcCalss:[CPProductCollectionViewController class]];
    CPSettingsItem *moreAbout = [CPSettingsItem itemWithTitle:@"关于" icon:@"MoreAbout"];
    group1.item = @[moreHelp, moreUpdate, moreShare, moreMessage, moreNetease, moreAbout];
    return group1;
}

@end
