//
//  TableViewCell.m
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/13.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TableViewCell.h"
#import "Model.h"
@implementation TableViewCell

- (void)setModel:(Model *)model{
    _model = model;
    
    NSString* imgUrl = _model.modelImage;
    
    NSURL* url = [NSURL URLWithString:imgUrl];
    NSData* data = [NSData dataWithContentsOfURL:url];
    
    UIImage* img = [UIImage imageWithData:data];
    
    _moiveView.image = img;
    _moiveTitle.text = _model.title;
    _moiveDetail.text = _model.modelDetail;
//    NSLog(@"%@",_moiveView.image);
    
}


@end
