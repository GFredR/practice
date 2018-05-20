//
//  CollectionViewCell.m
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/23.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation CollectionViewCell

- (void)setImgMod:(ImgModel *)imgMod{
    _imgMod = imgMod;
    
    NSString* fileURL = _imgMod.imgURL;
    
    NSURL* URL = [NSURL URLWithString:fileURL];
    
    [_detailImg sd_setImageWithURL:URL placeholderImage:[UIImage imageNamed:@"Default-568h@2x"]];
    
}

@end
