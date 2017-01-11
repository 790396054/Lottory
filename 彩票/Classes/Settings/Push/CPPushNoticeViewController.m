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
    // 从沙盒中取出存储的时间
    startItem.text  = [[NSUserDefaults standardUserDefaults] objectForKey:startItem.title];
    if (startItem.text.length == 0) {
        startItem.text = @"00:00";
    }
    [self setupOption:startItem index:1];
    
    group1.item = @[startItem];
    return group1;
}

// 添加第2组
-(CPSettingsGroup *)addGroup2{
    CPSettingsGroup *group2 = [[CPSettingsGroup alloc] init];
    CPSettingsLabelItem *endItem = [CPSettingsLabelItem itemWithTitle:@"结束时间" icon:nil];
    _endTime = endItem;
    group2.item = @[endItem];
    // 从沙盒中取出存储的时间
    endItem.text = [[NSUserDefaults standardUserDefaults] objectForKey:endItem.title];
    if (endItem.text.length == 0) {
        endItem.text = @"00:00";
    }
    [self setupOption:endItem index:2];
    return group2;
}

-(void)setupOption:(CPSettingsLabelItem *)item index:(NSInteger)index{
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
        if (index == 1) {
            [picker addTarget:self action:@selector(pickerClickOne:) forControlEvents: UIControlEventValueChanged];
        } else if(index == 2){
            [picker addTarget:self action:@selector(pickerClickTwo:) forControlEvents: UIControlEventValueChanged];
        }
        
        textField.inputView = picker;
        [self.view addSubview:textField];
        [textField becomeFirstResponder];
    };
}

/**
 监听 datePicker 的点击

 @param picker  picker
 */
-(void)pickerClickOne:(UIDatePicker *)picker{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    
    self.startTime.text = [fmt stringFromDate:picker.date];
    // 存储到沙盒中
    [[NSUserDefaults standardUserDefaults] setObject:self.startTime.text forKey:self.startTime.title];
    // 同步沙盒数据
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.tableView reloadData];
}


/**
 监听 datePicker 的点击
 
 @param picker  picker
 */
-(void)pickerClickTwo:(UIDatePicker *)picker{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"HH:mm";
    
    self.endTime.text = [fmt stringFromDate:picker.date];
    // 存储到沙盒中
    [[NSUserDefaults standardUserDefaults] setObject:self.endTime.text forKey:self.endTime.title];
    // 同步沙盒数据
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.tableView reloadData];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

@end
