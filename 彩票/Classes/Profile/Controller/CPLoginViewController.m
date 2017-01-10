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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 打开设置控制器

 @param sender 按钮
 */
- (IBAction)settings:(id)sender {
    CPSettingsTableViewController *vc = [[CPSettingsTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
