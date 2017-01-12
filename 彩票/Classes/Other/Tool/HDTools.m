//
//  HDTools.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/12.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "HDTools.h"

@implementation HDTools

/**
 通过图片Data数据第一个字节 来获取图片扩展名

 @param data data
 @return 图片扩展名
 */
+ (NSString *)contentTypeForImageData:(NSData *)data {
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

@end
