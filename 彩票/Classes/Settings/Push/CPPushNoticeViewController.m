//
//  CPPushNoticeViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPPushNoticeViewController.h"
#import "CPSettingsGroup.h"
#import "CPSettingsSwitchItem.h"
#import "CPSettingsLabelItem.h"

@interface CPPushNoticeViewController ()
@property (nonatomic, strong) CPSettingsLabelItem *startTime;
@property (nonatomic, strong) CPSettingsLabelItem *endTime;
@end

@implementation CPPushNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataList addObject:[self addGroup0]];
    [self.dataList addObject:[self addGroup1]];
    [self.dataList addObject:[self addGroup2]];
}

// 添加第0组
-(CPSettingsGroup *)addGroup0{
    CPSettingsGroup *group0 = [[CPSettingsGroup alloc] init];
    CPSettingsSwitchItem *noticeItem = [CPSettingsSwitchItem itemWithTitle:@"提醒我关注比赛" icon:nil];
    group0.footer = @"当我关注的比赛比分发生变化时，通过小弹窗或推送进行提醒";
    group0.item = @[noticeItem];
    return group0;
}

// 添加第1组
-(CPSettingsGroup *)addGroup1{
    CPSettingsGroup *group1 = [[CPSettingsGroup alloc] init];
    group1.header = @"只在以下时间接受比分直播";
    CPSettingsLabelItem *startItem = [CPSettingsLabelItem itemWithTitle:@"开始时间" icon:nil];
    _startTime = startItem;
    startItem.text = @"00:00";
    [self setupOption:startItem];
    
    group1.item = @[startItem];
    return group1;
}

// 添加第2组
-(CPSettingsGroup *)addGroup2{
    CPSettingsGroup *group2 = [[CPSettingsGroup alloc] init];
    CPSettingsLabelItem *endItem = [CPSettingsLabelItem itemWithTitle:@"结束时间" icon:nil];
    group2.item = @[endItem];
    endItem.text = @"00:00";
    [self setupOption:endItem];
    return group2;
}

-(void)setupOption:(CPSettingsLabelItem *)item{
    item.option = ^{
        UITextField *textField = [[UITextField alloc] init];
        // 创建 datePicker
        UIDatePicker *picker = [[UIDatePicker alloc] init];
        // 设置模式
        picker.datePickerMode = UIDatePickerModeTime;
        // 设置地区
        picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        // 设置时间
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"HH:mm";
        picker.date = [fmt dateFromString:@"00:00"];
        // 添加监听
        [picker addTarget:self action:@selector(pickerClick:) forControlEvents: UIControlEventValueChanged];
        
        textField.inputView = picker;
        [self.view addSubview:textField];
        [textField becomeFirstResponder];
    };
}

/**
 监听 datePicker 的点击

 @param picker  picker
 */
-(void)pickerClick:(UIDatePicker *)picker{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    self.startTime.text = [fmt stringFromDate:picker.date];
    
    [self.tableView reloadData];
}

@end
