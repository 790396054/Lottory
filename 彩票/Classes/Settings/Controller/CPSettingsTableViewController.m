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
#import "CPSettingsCell.h"
#import "CPSettingsArrowItem.h"
#import "CPSettingsSwitchItem.h"
#import "CPTestTableViewController.h"
#import "MBProgressHUD+MJ.h"
#import "CPProductCollectionViewController.h"
#import "CPPushTableViewController.h"

@interface CPSettingsTableViewController ()
/**数据集合*/
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation CPSettingsTableViewController

-(NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
        
        // 第0组
        CPSettingsGroup *group1 = [[CPSettingsGroup alloc] init];
        CPSettingsItem *morePush = [CPSettingsArrowItem itemWithTitle:@"推送和提醒" icon:@"MorePush" destVcCalss:[CPPushTableViewController class]];
        CPSettingsItem *handShake = [CPSettingsSwitchItem itemWithTitle:@"摇一摇机选" icon:@"handShake"];
        CPSettingsItem *soundEffect = [CPSettingsSwitchItem itemWithTitle:@"声音效果" icon:@"sound_Effect"];
        group1.item = @[morePush, handShake, soundEffect];
        
        // 第一组
        CPSettingsGroup *group2 = [[CPSettingsGroup alloc] init];
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
        group2.item = @[moreHelp, moreUpdate, moreShare, moreMessage, moreNetease, moreAbout];
        
        [_dataList addObject:group1];
        [_dataList addObject:group2];
    }
    return _dataList;
}

-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CPSettingsGroup *groups = self.dataList[section];
    return groups.item.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.创建cell
    CPSettingsCell *cell = [CPSettingsCell cellWithTableView:tableView];
    // 2.取出模型
    CPSettingsGroup *group = self.dataList[indexPath.section];
    CPSettingsItem *item = group.item[indexPath.row];
    // 3.传递模型（设置模型数据)
    cell.item = item;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CPSettingsGroup *group = self.dataList[section];
    return group.header;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CPSettingsGroup *group = self.dataList[section];
    return group.footer;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CPSettingsGroup *group = self.dataList[indexPath.section];
    CPSettingsItem *item = group.item[indexPath.row];
    // 执行操作
    if (item.option) {
        item.option();
        return; 
    }
    
    if ([item isKindOfClass:[CPSettingsArrowItem class]]) { // 箭头
        CPSettingsArrowItem *arrowItem = (CPSettingsArrowItem *)item;
        // 创建跳转的控制器
        if (arrowItem.destVcCalss) {
            UIViewController *vc = [[arrowItem.destVcCalss alloc] init];
            vc.title = arrowItem.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
