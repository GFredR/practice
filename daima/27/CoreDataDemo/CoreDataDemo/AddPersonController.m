//
//  AddPersonController.m


#import "AddPersonController.h"
#import "AppDelegate.h"
#import "Person.h"

@interface AddPersonController ()

@property (nonatomic, strong) UITextField *textFieldFirstName;
@property (nonatomic, strong) UITextField *textFieldLastName;
@property (nonatomic, strong) UITextField *textFieldAge;
@property (nonatomic, strong) UIBarButtonItem *barButtonAdd;

@end

@implementation AddPersonController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"New Person";
    
    CGRect textFieldRect = CGRectMake(20.0f,
                                      80.0f,
                                      self.view.bounds.size.width - 40.0f,
                                      31.0f);
    
    self.textFieldFirstName = [[UITextField alloc] initWithFrame:textFieldRect];
    self.textFieldFirstName.placeholder = @"First Name";
    self.textFieldFirstName.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldFirstName.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.textFieldFirstName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:self.textFieldFirstName];
    
    textFieldRect.origin.y += 37.0f;
    self.textFieldLastName = [[UITextField alloc] initWithFrame:textFieldRect];
    self.textFieldLastName.placeholder = @"Last Name";
    self.textFieldLastName.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldLastName.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.textFieldLastName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:self.textFieldLastName];
    
    textFieldRect.origin.y += 37.0f;
    self.textFieldAge = [[UITextField alloc] initWithFrame:textFieldRect];
    self.textFieldAge.placeholder = @"Age";
    self.textFieldAge.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldAge.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.textFieldAge.keyboardType = UIKeyboardTypeNumberPad;
    self.textFieldAge.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:self.textFieldAge];
    
    self.barButtonAdd = [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                                         style:UIBarButtonItemStylePlain
                                                        target:self
                                                        action:@selector(createNewPerson:)];
    
    [self.navigationItem setRightBarButtonItem:self.barButtonAdd
                                      animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self.textFieldFirstName becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNewPerson:(id)paramSender {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:managedObjectContext];
    
    if (person) {
        
        person.firstName = self.textFieldFirstName.text;
        person.lastName = self.textFieldLastName.text;
        person.age = [NSNumber numberWithInteger:[self.textFieldAge.text integerValue]];
        
        NSError *savingError = nil;
        
        /**
         *  ！！！！需要解决的问题？？？
         *  为什么这里不使用了 performFetch:方法
         */
        if ([managedObjectContext save:&savingError]) {
            
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            
            NSLog(@"Failed to save the managed object context.");
        }
    } else {
        
        NSLog(@"Failed to create the new person object.");
    }
}

@end
