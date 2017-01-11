//
//  CPHelp.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/11.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPHelp.h"

@implementation CPHelp

+(instancetype)helpWithDict:(NSDictionary *)dict{
    CPHelp *help = [[self alloc] init];
    
    help.title = dict[@"title"];
    help.html = dict[@"html"];
    help.ID = dict[@"id"];
    
    return help;
}
@end
