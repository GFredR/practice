//
//  TableViewCell.h
//  CollectionView
//
//  Created by 郭丰锐 on 2018/4/13.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *moiveView;
@property (strong, nonatomic) IBOutlet UILabel *moiveTitle;
@property (strong, nonatomic) IBOutlet UILabel *moiveDetail;
@property (strong, nonatomic)Model* model;
@end
