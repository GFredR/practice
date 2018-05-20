//
//  TittleView.m
//  当当个人界面
//
//  Created by 郭丰锐 on 2018/3/1.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "TittleView.h"
#import "TittleBtn.h"


@implementation TittleView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(20, 40, 70, 70)];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.layer.cornerRadius = 35;
        [btn addTarget:self action:@selector(headerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        NSArray* imageNames = @[@"ff_IconLocationService",@"ff_IconQRCode",@"ff_IconShake",@"ff_IconShowAlbum"];
        
        
        NSArray* tittleNames = @[@"我的发布",@"我的收藏",@"我的留言",@"历史记录"];
        
        CGFloat btnWidth = CGRectGetWidth(frame)/4;
        CGFloat btnHeight = CGRectGetHeight(frame)/3;
        
        for (NSInteger i = 0; i<4; i++) {
            TittleBtn* btn = [[TittleBtn alloc] initWithFrame:CGRectMake(i*btnWidth, CGRectGetHeight(frame)-btnHeight, btnWidth, btnHeight) tittle:tittleNames[i] image:[UIImage imageNamed:imageNames[i]]];
            [self addSubview:btn];
        }
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        NSLog(@"%@",imageNames);
        
        
        
        
        
    }
    return self;
}

@end
