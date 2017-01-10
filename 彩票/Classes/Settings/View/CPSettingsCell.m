//
//  CPSettingsCell.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPSettingsCell.h"
#import "CPSettingsItem.h"
#import "CPSettingsSwitchItem.h"
#import "CPSettingsArrowItem.h"

@interface CPSettingsCell()
@property (nonatomic, strong) UISwitch *itemSwitch;
@property (nonatomic, strong) UIImageView *arrow;
@end

@implementation CPSettingsCell

#pragma mark - 懒加载方法
-(UISwitch *)itemSwitch{
    if (_itemSwitch == nil) {
        _itemSwitch = [[UISwitch alloc] init];
        _itemSwitch.on = YES;
    }
    return _itemSwitch;
}

-(UIImageView *)arrow{
    if (_arrow == nil) {
        _arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrow;
}

#pragma mark - 初始化方法
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"cell";
    CPSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[CPSettingsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(void)setItem:(CPSettingsItem *)item{
    _item = item;
    [self setupData];
    
    [self setupAccessoryView];
}

#pragma mark - 内部方法
/**
 设置数据
 */
-(void)setupData{
    if (self.item.title) {
        self.textLabel.text = self.item.title;
    }
    if (self.item.icon) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
}

/**
 设置右边的视图
 */
-(void)setupAccessoryView{
    if ([self.item isKindOfClass:[CPSettingsArrowItem class]]) { // 箭头
        self.accessoryView = self.arrow;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else if([self.item isKindOfClass:[CPSettingsSwitchItem class]]){ // Switch
        self.accessoryView = self.itemSwitch;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else {
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

@end
