//
//  CPProductCell.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPProductCell.h"
#import "CPProduct.h"

@interface CPProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation CPProductCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    // 圆角裁剪
//    self.layer.cornerRadius = 10;
//    self.clipsToBounds = YES;
//    self.layer.masksToBounds = YES;
}

-(void)setProduct:(CPProduct *)product{
    self.imageView.image = [UIImage imageNamed:product.icon];
    self.textLabel.text = product.title;
}

@end
