//
//  CPProduct.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPProduct : NSObject
/*"title": "网易新闻",
 "id": "com.netease.news",
 "url": "http://itunes.apple.com/app/id425349261?mt=8",
 "icon": "newsapp@2x.png",
 "customUrl": "newsapp"
 */
/**标题*/
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;

+(instancetype)productWithDict:(NSDictionary *)dict;
@end
