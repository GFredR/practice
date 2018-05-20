//
//  ViewController.h
//  CustomPicker


#import <UIKit/UIKit.h>
#import "AnimalChooserViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *outputLabel;
@property (nonatomic) Boolean animalChooserVisible;

- (void)displayAnimal:(NSString *)chosenAnimal withSound:(NSString *)chosenSound fromComponent:(NSString *)chosenComponent;
- (IBAction)showAnimalChooser:(id)sender;

@end
