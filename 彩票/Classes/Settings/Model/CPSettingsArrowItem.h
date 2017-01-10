//
//  CPSettingsArrowItem.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPSettingsItem.h"

@interface CPSettingsArrowItem : CPSettingsItem

/**
 跳转的控制器的类名
 */
@property (nonatomic, assign) Class destVcCalss;

+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon destVcCalss:(Class)destVcCalss;

@end
