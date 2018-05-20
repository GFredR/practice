//
//  APLabel.h
//  Test

#import <UIKit/UIKit.h>


@protocol APLabelDelegate <NSObject>

@required
- (void) didLetterFound:(char)letter;

@end


@interface APLabel : UILabel

@property (nonatomic, assign) id <APLabelDelegate> delegate;

@end
