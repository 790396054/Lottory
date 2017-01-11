//
//  CPHelp.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/11.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPHelp : NSObject
/*
 {
 "title" : "如何提现？",
 "html" : "help.html",
 "id" : "howtowithdraw"
 },
 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

+(instancetype)helpWithDict:(NSDictionary *)dict;
@end
