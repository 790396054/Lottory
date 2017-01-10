//
//  CPProduct.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPProduct.h"

@implementation CPProduct

+(instancetype)productWithDict:(NSDictionary *)dict{
    CPProduct *product = [[self alloc] init];
    
    //[product setValuesForKeysWithDictionary:dict];
    
    product.title = dict[@"title"];
    product.ID = dict[@"id"];
    product.icon = dict[@"icon"];
    product.newsapp = dict[@"newsapp"];
    product.url = dict[@"url"];
    
    return product;
}

-(void)setIcon:(NSString *)icon{
    _icon = [icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
}

@end
