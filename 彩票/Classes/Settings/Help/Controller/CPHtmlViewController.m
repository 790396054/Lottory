//
//  CPHtmlViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/11.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPHtmlViewController.h"
#import "CPHelp.h"

@interface CPHtmlViewController ()<UIWebViewDelegate>

@end

@implementation CPHtmlViewController

-(void)loadView{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancleVc)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    // 加载网页资源
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.help.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    [webView loadRequest:request];
}

/**
 取消的方法
 */
-(void)cancleVc{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 网页加载完毕调用
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *js = [NSString stringWithFormat:@"window.location.href = '#%@';",self.help.ID];
    [webView stringByEvaluatingJavaScriptFromString:js];
}

@end
