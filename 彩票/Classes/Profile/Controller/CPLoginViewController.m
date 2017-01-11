//
//  CPLoginViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/9.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPLoginViewController.h"
#import "CPSettingsTableViewController.h"

@interface CPLoginViewController ()
- (IBAction)settings:(id)sender;

@end

@implementation CPLoginViewController

/**
 打开设置控制器

 @param sender 按钮
 */
- (IBAction)settings:(id)sender {
    CPSettingsTableViewController *vc = [[CPSettingsTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
