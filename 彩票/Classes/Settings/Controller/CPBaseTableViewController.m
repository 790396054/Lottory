//
//  CPBaseTableViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPBaseTableViewController.h"
#import "CPSettingsGroup.h"
#import "CPSettingsItem.h"
#import "CPSettingsCell.h"
#import "CPSettingsArrowItem.h"

@interface CPBaseTableViewController ()

@end

@implementation CPBaseTableViewController

#pragma mark - 懒加载
-(NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - 数据源方法
// 返回有多少组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}

// 返回每组有多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CPSettingsGroup *group = self.dataList[section];
    return group.item.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 创建 cell
    CPSettingsCell *cell = [CPSettingsCell cellWithTableView:tableView];
    // 取出模型
    CPSettingsGroup *group = self.dataList[indexPath.section];
    CPSettingsItem *item = group.item[indexPath.row];
    // 设置模型（传递数据）
    cell.item = item;

    return cell;
}

// 设置头部标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CPSettingsGroup *group = self.dataList[section];
    return group.header;
}

// 设置尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CPSettingsGroup *group = self.dataList[section];
    return group.footer;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CPSettingsGroup *group = self.dataList[indexPath.section];
    CPSettingsItem *item = group.item[indexPath.row];
    // 执行代码
    if (item.option) {
        item.option();
        return;
    }
    
    if ([item isKindOfClass:[CPSettingsArrowItem class]]) { // 箭头
        CPSettingsArrowItem *arrowItem = (CPSettingsArrowItem *)item;
        // 创建跳转的控制器
        if (arrowItem.destVcCalss) {
            UIViewController *vc = [[[arrowItem.destVcCalss class] alloc] init];
            vc.title = arrowItem.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

@end
