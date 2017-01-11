//
//  CPAboutHeaderView.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/11.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPAboutHeaderView.h"

@implementation CPAboutHeaderView

+(instancetype)headerView{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CPAboutHeaderView *view = [[self alloc] init];
    view.frame = CGRectMake(0, 0, width, 260);
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"about_logo"]];
    image.bounds = CGRectMake(0, 0, 200, 62);
    image.center = CGPointMake(view.center.x, 70);
    
    UILabel *version = [[UILabel alloc] init];
    version.text = @"版本：3.2 build 181";
    version.font = [UIFont systemFontOfSize:12];
    version.frame = CGRectMake(60, image.frame.origin.y + 80, width, 14);
    
    UILabel *website = [[UILabel alloc] init];
    website.text = @"官网：http://www.netbase.com";
    website.font = [UIFont systemFontOfSize:12];
    website.frame = CGRectMake(60, version.frame.origin.y + 20, width, 14);

    UILabel *copyright1 = [[UILabel alloc] init];
    copyright1.text = @"版权：网易公司NetEase Infomation";
    copyright1.font = [UIFont systemFontOfSize:12];
    copyright1.frame = CGRectMake(60, website.frame.origin.y + 20, width, 14);
    
    UILabel *copyright2 = [[UILabel alloc] init];
    copyright2.text = @"Technology(Beijing) Co..Ltd";
    copyright2.font = [UIFont systemFontOfSize:12];
    copyright2.frame = CGRectMake(95, copyright1.frame.origin.y + 20, width, 14);
    
    [view addSubview:image];
    [view addSubview:version];
    [view addSubview:website];
    [view addSubview:copyright1];
    [view addSubview:copyright2];
    return view;
}

@end
