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
#import "CPSettingsLabelItem.h"

@interface CPSettingsCell()
@property (nonatomic, strong) UISwitch *itemSwitch;
@property (nonatomic, strong) UIImageView *arrow;
@property (nonatomic, strong) UILabel *labelText;
@end

@implementation CPSettingsCell

#pragma mark - 懒加载方法
-(UILabel *)labelText{
    if (_labelText == nil) {
        _labelText = [[UILabel alloc] init];
        _labelText.bounds = CGRectMake(0, 0, 100, 44);
        _labelText.font = [UIFont systemFontOfSize:14];
        _labelText.textAlignment = NSTextAlignmentRight;
    }
    return _labelText;
}

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
        cell = [[CPSettingsCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
    if (self.item.title.length) {
        self.textLabel.text = self.item.title;
    }
    if (self.item.icon.length) {
        self.imageView.image = [UIImage imageNamed:self.item.icon];
    }
    if (self.item.subTitle.length){
        self.detailTextLabel.text = self.item.subTitle;
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
    } else if([self.item isKindOfClass:[CPSettingsLabelItem class]]){ // Label
        self.accessoryView = self.labelText;
        CPSettingsLabelItem *LabelItem = (CPSettingsLabelItem *)self.item;
        self.labelText.text = LabelItem.text;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    } else { // 什么也没有
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}

@end
