//
//  CPSettingsItem.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/9.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CPSettingsItemOption)();

@interface CPSettingsItem : NSObject
/**标题*/
@property (nonatomic, copy) NSString *title;
/**图标*/
@property (nonatomic, copy) NSString *icon;
/**
 保存一段代码,在恰当的时候调用
 */
@property (nonatomic, copy) CPSettingsItemOption option;
/**
 创建一个设置条目

 @param title 标题
 @param icon 图标
 @return 设置条目
 */
+(instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon;

@end
