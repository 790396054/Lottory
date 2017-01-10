//
//  CPSettingsGroup.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPSettingsGroup : NSObject
/**头部标题*/
@property (nonatomic, copy) NSString *header;
/**尾部标题*/
@property (nonatomic, copy) NSString *footer;
/**条目*/
@property (nonatomic, strong) NSArray *item;
@end
