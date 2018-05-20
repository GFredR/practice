//
//  ViewController.m


#import "ViewController.h"

@interface ViewController () {
    UILabel *nameLabel;
    UILabel *phoneNumberLabel;
    UIImageView *imgView;
}

-(void) openContacts:(UIButton *) sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 50, [UIScreen mainScreen].bounds.size.width - 20, 50)];
    [btn setImage:[UIImage imageNamed:@"contacts"] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"从通讯录获取" forState:UIControlStateNormal];
    btn.layer.cornerRadius = 5;
    btn.clipsToBounds = YES;
    [btn addTarget:self action:@selector(openContacts:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
 
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 120, [UIScreen mainScreen].bounds.size.width - 20, 50)];
    nameLabel.text = @"姓名";
    [self.view addSubview:nameLabel];

    phoneNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width - 20, 50)];
    phoneNumberLabel.text = @"电话";
    [self.view addSubview:phoneNumberLabel];
    
    imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 300, [UIScreen mainScreen].bounds.size.width - 20, 200)];
    imgView.hidden = YES;
    [self.view addSubview:imgView];
}

// 通讯录  点选一个联系人后会进入该联系人详细内容页
- (void)contactPicker:(CNContactPickerViewController *)picker  didSelectContactProperty:(CNContactProperty *)contactProperty {
    CNPhoneNumber *thisnumber = contactProperty.value;
    CNContact *contact = contactProperty.contact;
    
    // 姓名
    NSString *name = [NSString stringWithFormat:@"%@ %@", contact.givenName, contact.familyName];
    nameLabel.text = [NSString stringWithFormat:@"姓名 : %@", name];

    // 电话
    phoneNumberLabel.text = [NSString stringWithFormat:@"电话 : %@", thisnumber.stringValue];
    
    // 照片
    if (contact.imageDataAvailable) {
        imgView.hidden = NO;
        imgView.image = [UIImage imageWithData:contact.imageData];
    } else {
        imgView.hidden = YES;
    }

}

// 按下[从通讯录选取]按鈕
-(void) openContacts:(UIButton *) sender {
    CNContactPickerViewController * picker = [[CNContactPickerViewController alloc]init];
    picker.delegate = self;
    picker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
