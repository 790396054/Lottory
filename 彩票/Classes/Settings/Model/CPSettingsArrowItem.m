//
//  CPSettingsArrowItem.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPSettingsArrowItem.h"

@implementation CPSettingsArrowItem

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destVcCalss:(Class)destVcCalss{
    CPSettingsArrowItem *item = [super itemWithTitle:title icon:icon];
    item.destVcCalss = destVcCalss;
    return item;
}

@end
