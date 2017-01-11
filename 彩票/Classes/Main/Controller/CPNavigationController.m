//
//  CPNavigationController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/9.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPNavigationController.h"

@interface CPNavigationController ()

@end

@implementation CPNavigationController

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    return [super pushViewController:viewController animated:animated];
}

@end
