//
//  CPSettingsCell.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//  设置cell

#import <UIKit/UIKit.h>
@class CPSettingsItem;

@interface CPSettingsCell : UITableViewCell

/**
 条目
 */
@property (nonatomic, strong) CPSettingsItem *item;

/**
 创建cell

 @param tableView tableView
 @return cell
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
