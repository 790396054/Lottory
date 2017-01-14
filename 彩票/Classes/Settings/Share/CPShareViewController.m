//
//  CPShareViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/11.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPShareViewController.h"
#import "CPSettingsArrowItem.h"
#import "CPSettingsGroup.h"
#import <MessageUI/MessageUI.h>

@interface CPShareViewController ()<MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>
@end

@implementation CPShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addGroup];
}

-(void)addGroup{
    CPSettingsGroup *group = [[CPSettingsGroup alloc] init];
    
    CPSettingsArrowItem *sinaShare = [CPSettingsArrowItem itemWithTitle:@"新浪分享" icon:@"WeiboSina"];
    CPSettingsArrowItem *messageShare = [CPSettingsArrowItem itemWithTitle:@"短信分享" icon:@"SmsShare"];
    // 用若指针，解决block中的循环引用，导致内存泄漏问题
    __weak CPShareViewController *share = self;
    messageShare.option = ^{
        MFMessageComposeViewController *vc = [[MFMessageComposeViewController alloc] init];
        vc.body = @"测试短信"; // 短信内容
        vc.recipients = @[@"10086", @"18569693256"]; // 收件人列表
        vc.messageComposeDelegate = share; //用若指针，解决block中的循环引用，导致内存泄漏问题
        // 显示控制器
        [share presentViewController:vc animated:YES completion:nil]; //用若指针，解决block中的循环引用，导致内存泄漏问题
    };
    
    CPSettingsArrowItem *emailShare = [CPSettingsArrowItem itemWithTitle:@"邮件分享" icon:@"MailShare"];
    emailShare.option = ^{
        // 不能发邮件
        if (![MFMailComposeViewController canSendMail]) return;
        
        MFMailComposeViewController *vc = [[MFMailComposeViewController alloc] init];
        
        // 设置邮件主题
        [vc setSubject:@"会议"];
        // 设置邮件内容
        [vc setMessageBody:@"今天下午开会吧" isHTML:NO];
        // 设置收件人列表
        [vc setToRecipients:@[@"643055866@qq.com"]];
        // 设置抄送人列表
        [vc setCcRecipients:@[@"1234@qq.com"]];
        // 设置密送人列表
        [vc setBccRecipients:@[@"56789@qq.com"]];
        
        
        // 添加附件（一张图片）
        UIImage *image = [UIImage imageNamed:@"阿狸头像"];
        NSData *data = UIImagePNGRepresentation(image);
        [vc addAttachmentData:data mimeType:@"image/png" fileName:@"阿狸头像.png"];
        // 设置代理
        vc.mailComposeDelegate = share;
        // 显示控制器
        [share presentViewController:vc animated:YES completion:nil];
        
    };
    group.item = @[sinaShare, messageShare, emailShare];
    
    [self.dataList addObject:group];
}

// 短信发送的代理方法回调。
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)dealloc{
    NSLog(@"%%delloc");
}

//邮件发送后的代理方法回调，发完后会自动回到原应用
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    // 关闭邮件界面
    [controller dismissViewControllerAnimated:YES completion:nil];
    
    if (result == MFMailComposeResultCancelled) {
        NSLog(@"取消发送");
    } else if (result == MFMailComposeResultSent) {
        NSLog(@"已经发出");
    } else {
        NSLog(@"发送失败");
    }
}


@end
