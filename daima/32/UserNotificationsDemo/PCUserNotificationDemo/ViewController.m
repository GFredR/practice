//
//  ViewController.m


#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)showImage
{
    _imgView.image = [UIImage imageNamed:@"Valeera.jpg"];
    _imgView.hidden = NO;
}

- (IBAction)sendPlainNoti:(id)sender
{
    _imgView.hidden = YES;
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = [NSString localizedUserNotificationStringForKey:@"Here is a test noti!" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"I'am noti content body~" arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    content.categoryIdentifier = NotificationTypePlainId;
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"requestId" content:content trigger:[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2.0 repeats:NO]];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

- (IBAction)sendServiceExtensionNoti:(id)sender {
    _imgView.hidden = YES;
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = [NSString localizedUserNotificationStringForKey:@"I'm Valeera!" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"Watch your back" arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    content.categoryIdentifier = NotificationTypeServiceExtensionId;
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Valeera" ofType:@"gif"]];
    UNNotificationAttachment *attach = [UNNotificationAttachment attachmentWithIdentifier:@"attachId" URL:url options:nil error:nil];
    if (attach)
    {
        content.attachments = @[attach];
    }
    
     UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"requestId" content:content trigger:[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2.0 repeats:NO]];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

- (IBAction)sendContentExtensionNoti:(id)sender
{
    _imgView.hidden = YES;
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = [NSString localizedUserNotificationStringForKey:@"Here is a test noti!" arguments:nil];
    content.body = [NSString localizedUserNotificationStringForKey:@"文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~文章内容~" arguments:nil];
    content.sound = [UNNotificationSound defaultSound];
    content.categoryIdentifier = NotificationTypeContentExtensionId;
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Valeera" ofType:@"gif"]];
    UNNotificationAttachment *attach = [UNNotificationAttachment attachmentWithIdentifier:@"attachId" URL:url options:nil error:nil];
    if (attach)
    {
        content.attachments = @[attach];
    }
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"requestId" content:content trigger:[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2.0 repeats:NO]];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error);
    }];
}

@end
