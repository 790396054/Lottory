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
#import "CPSettingsItem.h"
#import "CPSettingsCell.h"
#import "CPTestViewController.h"

@interface CPPushTableViewController ()
/**数据源*/
@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation CPPushTableViewController

-(NSMutableArray *)dataList{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
        CPSettingsGroup *group0 = [[CPSettingsGroup alloc] init];
        
        CPSettingsItem *lottoryNumber = [CPSettingsArrowItem itemWithTitle:@"开奖号码推送" icon:nil destVcCalss:[CPTestViewController class]];
        CPSettingsItem *anim = [CPSettingsArrowItem itemWithTitle:@"中奖动画" icon:nil destVcCalss:[CPTestViewController class]];
        CPSettingsItem *scott = [CPSettingsArrowItem itemWithTitle:@"比分直播提醒" icon:nil destVcCalss:[CPTestViewController class]];
        CPSettingsItem *buy = [CPSettingsArrowItem itemWithTitle:@"购彩定时提醒" icon:nil destVcCalss:[CPTestViewController class]];
        
        group0.item = @[lottoryNumber, anim, scott, buy];
        
        [_dataList addObject:group0];
    }
    return _dataList;
}

-(instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CPSettingsGroup *group = self.dataList[section];
    return group.item.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CPSettingsCell *cell = [CPSettingsCell cellWithTableView:tableView];
    
    CPSettingsGroup *group = self.dataList[indexPath.section];
    CPSettingsItem *item = group.item[indexPath.row];
    
    cell.item = item;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    CPSettingsGroup *group = self.dataList[indexPath.section];
    CPSettingsItem *item = group.item[indexPath.row];
    
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
