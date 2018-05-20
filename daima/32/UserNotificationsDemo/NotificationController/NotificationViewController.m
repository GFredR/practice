//
//  NotificationViewController.m


#import "NotificationViewController.h"
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

@interface NotificationViewController () <UNNotificationContentExtension>

@property IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any required interface initialization here.
}

- (void)didReceiveNotification:(UNNotification *)notification {
    self.label.text = notification.request.content.body;
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.40407.com/uploads/allimg/140623/878963_140623095142_1.gif"]];
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * data, NSURLResponse *response, NSError *error) {
        UIImage *img = [UIImage imageWithData:data];
        if (img)
        {
            self.imgView.image = img;
        }
    }];
    
    [task resume];
    
}

@end
