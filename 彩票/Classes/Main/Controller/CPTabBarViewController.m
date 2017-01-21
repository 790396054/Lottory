//
//  CPTabBarViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/9.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPTabBarViewController.h"
#import "CPTabBar.h"

@interface CPTabBarViewController ()<CPTabBarDelegate>

@end

@implementation CPTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar removeFromSuperview];
    
    CPTabBar *tabtar = [[CPTabBar alloc] init];
    tabtar.frame = self.tabBar.frame;
    
    tabtar.delegate = self;
    
    [self.view addSubview:tabtar];
    
    // 获取应用程序中的所有导航条
    // 获取所有导航条外观 
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [bar setTitleTextAttributes:dict];
    
    // 主题颜色
    [bar setTintColor:[UIColor whiteColor]];
}

#pragma mark - 代理方法
-(void)tabBar:(CPTabBar *)tabBar didSelectedIndex:(NSInteger)index{
    self.selectedIndex = index;
}

@end
