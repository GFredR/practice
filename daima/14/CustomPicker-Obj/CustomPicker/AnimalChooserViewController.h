//
//  AnimalChooserViewController.h
//  CustomPicker

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AnimalChooserViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> 

@property (strong, nonatomic) id delegate;
@property (strong, nonatomic) NSArray *animalNames;
@property (strong, nonatomic) NSArray *animalSounds;
@property (strong, nonatomic) NSArray *animalImages;

- (IBAction)dismissAnimalChooser:(id)sender;

@end
