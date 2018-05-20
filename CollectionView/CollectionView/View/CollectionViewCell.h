//
//  CollectionViewCell.h
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/23.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImgModel.h"
@interface CollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *detailImg;
@property (strong, nonatomic)ImgModel* imgMod;
@end
