//
//  ViewController.m
//  AlertControllerSheet
//
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pressButton:(id)sender {
    
    UIAlertController *alertController;
    UIAlertAction *destroyAction;
    UIAlertAction *otherAction;
    
    alertController = [UIAlertController
                                          alertControllerWithTitle:@"Reason"
                                          message:@"Select the following"
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    
    destroyAction = [UIAlertAction actionWithTitle:@"Remove All Data"
                                             style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *action) {
                                               // do destructive stuff here
                                           }];
    otherAction = [UIAlertAction actionWithTitle:@"Blah"
                                           style:UIAlertActionStyleDefault
                                         handler:^(UIAlertAction *action) {
                                             // do something here
                                         }];
    // note: you can control the order buttons are shown, unlike UIActionSheet
    [alertController addAction:destroyAction];
    [alertController addAction:otherAction];
    
    [alertController setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [alertController
                                                     popoverPresentationController];
    popPresenter.sourceView = self.button;
    popPresenter.sourceRect = self.button.bounds;

    
    [self presentViewController:alertController animated:YES completion:nil];

}
@end
