//
//  CPHelpViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/11.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPHelpViewController.h"
#import "CPHelp.h"
#import "CPSettingsGroup.h"
#import "CPSettingsArrowItem.h"
#import "CPNavigationController.h"
#import "CPHtmlViewController.h"

@interface CPHelpViewController ()

@property (nonatomic, strong) NSMutableArray *helps;

@end

@implementation CPHelpViewController

-(NSMutableArray *)helps{
    if (_helps == nil) {
        _helps = [NSMutableArray array];
        
        // 解析json
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:fileName];
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dict in jsonArray) {
            CPHelp *help = [CPHelp helpWithDict:dict];
            [_helps addObject:help];
        }
    }
    return _helps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup];
}

-(void)addGroup{
    CPSettingsGroup *group = [[CPSettingsGroup alloc] init];
    NSMutableArray *items = [NSMutableArray array];
    for (CPHelp *help in self.helps) {
        CPSettingsArrowItem *item = [CPSettingsArrowItem itemWithTitle:help.title icon:nil destVcCalss:nil];
        [items addObject:item];
    }
    group.item = items;
    [self.dataList addObject:group];
}

// 重写tableView的点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取出模型
    CPHelp *help = self.helps[indexPath.row];
    
    CPHtmlViewController *vc = [[CPHtmlViewController alloc] init];
    vc.help = help;
    vc.title = help.title;
    CPNavigationController *nav = [[CPNavigationController alloc] initWithRootViewController:vc];
    
    [self presentViewController:nav animated:YES completion:nil];
}
@end
