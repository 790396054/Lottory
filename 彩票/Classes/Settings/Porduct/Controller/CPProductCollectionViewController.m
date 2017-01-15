//
//  CPProductCollectionViewController.m
//  彩票
//
//  Created by 弓苗苗 on 2017/1/10.
//  Copyright © 2017年 hdtytech. All rights reserved.
//

#import "CPProductCollectionViewController.h"
#import "CPProduct.h"
#import "CPProductCell.h"
#import "MBProgressHUD+MJ.h"

@interface CPProductCollectionViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CPProductCollectionViewController
/*
  使用UICollectionView
  第一步：必须有布局
  第二步：cell必须自己注册
*/

static NSString *ID = @"cell";

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:fileName];
        
        NSArray *jsonArray= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *dict in jsonArray) {
            CPProduct *product = [CPProduct productWithDict:dict];
            [_dataArray addObject:product];
        }
    }
    return _dataArray;
}

-(instancetype)init{
    // 创建流水布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 每一个cell的尺寸
    flowLayout.itemSize = CGSizeMake(80, 80);
    // 垂直间距
    flowLayout.minimumInteritemSpacing = 5;
    // 水平间距
    flowLayout.minimumLineSpacing = 10;
    // 内边距
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // 注册collectionViewCell 如果没有从缓存池找到,就会自动创建
    UINib *nib = [UINib nibWithNibName:@"CPProductCell" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ID];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 数据源方法
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CPProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];

    CPProduct *product = self.dataArray[indexPath.item];
    
    cell.product = product;
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    CPProduct *product = self.dataArray[indexPath.item];
    NSString *title = [NSString stringWithFormat:@"点击了%@", product.title];
    [MBProgressHUD showSuccess:title];
    
    UIApplication *app = [UIApplication sharedApplication];
    NSString *urlStr = [NSString stringWithFormat:@"%@://%@", product.customUrl, product.ID];
    NSURL *url = [NSURL URLWithString:urlStr];
    if ([app canOpenURL:url]) { // 能打开这个 URL，手机上安装了这个应用
        [app openURL:url];
    } else { // 不能打开，手机上没有安装这个应用
        [app openURL:[NSURL URLWithString:product.url]];
        
    }
}

@end
