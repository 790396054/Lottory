//
//  CPTabBar.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/9.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPTabBar.h"
#import "CPButton.h"

@interface CPTabBar()
/**选中的按钮*/
@property (nonatomic, weak) CPButton *selectedButton;
@end

@implementation CPTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加按钮
        [self addBtns];
        
    }
    return self;
}

/**
 添加按钮
 */
-(void)addBtns{
    NSString *bg = nil;
    NSString *bgHigh = nil;
    
    for (NSInteger i = 0; i < 5; i++) {
        CPButton *btn = [[CPButton alloc] init];
        btn.tag = i;
        
        bg = [NSString stringWithFormat:@"TabBar%ld", i + 1];
        bgHigh = [NSString stringWithFormat:@"TabBar%ldSel", i +1];
        
        [btn setBackgroundImage:[UIImage imageNamed:bg] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:bgHigh] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:btn];
        if(i == 0){
            [self btnClick:btn];
        }
    }
}


/**
 按钮点击的监听

 @param btn 被点击的按钮
 */
-(void)btnClick:(CPButton *)btn{
    _selectedButton.selected = NO;
    btn.selected = YES;
    _selectedButton = btn;
    
    // 切换控制器
    if([self.delegate respondsToSelector:@selector(tabBar:didSelectedIndex:)]){
        [self.delegate tabBar:self didSelectedIndex:btn.tag];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSInteger count = self.subviews.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.frame.size.width / count;
    CGFloat height = self.frame.size.height;
    for (NSInteger i = 0; i < count; i++) {
        CPButton *btn = self.subviews[i];
        x = i * width;
        btn.frame = CGRectMake(x, y, width, height);
    }
   
}

@end
