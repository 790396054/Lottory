//
//  CPTabBar.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/9.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPTabBar;

typedef enum CPTabBar{
    CPTabBarButtonTypeHall, // 购彩大厅
    CPTabBarButtonTypeBuy, // 合买跟单
    CPTabBarButtonTypeLotteryInfomition, // 开奖信息
    CPTabBarButtonTypeSquare, // 幸运广场
    CPTabBarButtonTypeBuyMine // 我的彩票
}CPTabBarButtonType;

@protocol CPTabBarDelegate <NSObject>

@optional

/**
 点击了索引的那个按钮

 @param tabBar CPTabBar
 @param index 索引
 */
-(void)tabBar:(CPTabBar *)tabBar didSelectedIndex:(NSInteger)index;

@end

@interface CPTabBar : UIView

@property (nonatomic, weak) id<CPTabBarDelegate> delegate;

@end
