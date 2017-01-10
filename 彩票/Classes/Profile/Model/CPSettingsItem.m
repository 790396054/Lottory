//
//  CPSettingsItem.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/9.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPSettingsItem.h"

@implementation CPSettingsItem

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon{
    CPSettingsItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

@end
