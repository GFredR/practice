/*
 Copyright (C) 2014 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 
  Keychain with Touch ID demo implementation
  
 */
#import "AAPLTest.h"
#import"AAPLBasicTestViewController.h"

@interface AAPLKeychainTestsViewController : AAPLBasicTestViewController

@property (unsafe_unretained, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *dynamicViewHeight;
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *tableView;

@end
