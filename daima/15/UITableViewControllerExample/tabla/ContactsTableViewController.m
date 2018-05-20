//
//  TablaViewController.m
//  tabla
//


#import "ContactsTableViewController.h"
#import "ContactTableViewCell.h"
#import "ContactModel.h"
#import "ContactRepository.h"

@interface ContactsTableViewController ()
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSMutableDictionary *thumbnailImages;
@end

@implementation ContactsTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ContactRepository *contactRepository = [ContactRepository sharedInstance];
    
    self.contacts = [contactRepository contacts];
    
    self.thumbnailImages = [NSMutableDictionary new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.contacts.count;
}

- tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"superCell"];
    
    ContactModel *contact= [self.contacts objectAtIndex:indexPath.row];
    
    cell.nombreLabel.text = contact.name;
    
    UIImage *thumbnailImage = [self.thumbnailImages objectForKey:contact.thumbnail.description];
    
    if (thumbnailImage) {
        cell.photoImageView.image = thumbnailImage;
    }else {
        [self downloadImageForContact:contact];
    }

    return cell;
}

- (void)downloadImageForContact:(ContactModel *)contact {
   
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:contact.thumbnail completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        [self.thumbnailImages setObject:[UIImage imageWithData:data] forKey:contact.thumbnail.description];
        
        dispatch_async(dispatch_get_main_queue(),^{
            //esto se ejecuta en main
            [self.tableView reloadData];
        });
    }];
    
    [dataTask resume];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
