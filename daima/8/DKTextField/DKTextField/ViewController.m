//
//  ViewController.m
//  DKTextField


#import "ViewController.h"
#import "DKTextField.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet DKTextField *textField;

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

- (IBAction)switchChanged:(UISwitch *)sender {
    self.textField.secureTextEntry = sender.on;
}

@end
