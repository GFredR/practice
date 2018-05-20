//
//  ViewController.h
//  UIPickerViewTest
//
//  Created by yeeku on 14/12/6.
//  Copyright (c) 2014年 crazyit.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@end

