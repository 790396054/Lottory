//
//  CPProductCell.h
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CPProduct;

@interface CPProductCell : UICollectionViewCell
/**产品模型*/
@property (nonatomic, strong) CPProduct *product;

@end
