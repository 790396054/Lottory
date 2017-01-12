//
//  HDTools.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/12.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDTools : NSObject
/**
 通过图片Data数据第一个字节 来获取图片扩展名
 
 @param data data
 @return 图片扩展名
 */
+ (NSString *)contentTypeForImageData:(NSData *)data;

@end
