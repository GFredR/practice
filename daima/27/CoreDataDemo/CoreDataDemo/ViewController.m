//
//  ViewController.m


#import "ViewController.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "AddPersonController.h"
#import "Person.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIBarButtonItem *barButtonAddPerson;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self initCoreData];
    
    self.title = @"Person";
    
    self.tableView  = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    self.barButtonAddPerson = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                            target:self
                                                                            action:@selector(addNewPerson:)];
    
    [self.navigationItem setLeftBarButtonItem:[self editButtonItem] animated:YES];
    [self.navigationItem setRightBarButtonItem:self.barButtonAddPerson animated:YES];
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    
    if (editing) {
        
        [self.navigationItem setRightBarButtonItem:nil animated:YES];
    } else {
        
        [self.navigationItem setRightBarButtonItem:self.barButtonAddPerson animated:YES];
    }
    
    [self.tableView setEditing:editing animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addNewPerson:(id)paramSender {
    
    AddPersonController *addPersonController = [[AddPersonController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:addPersonController animated:YES];
}

/**
 *  获取上下文信息
 */
- (NSManagedObjectContext *)managedObjectContext {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    return managedObjectContext;
}

- (void)initCoreData {
    
    /**
     *  获取实例
     */
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[self managedObjectContext]];
    
    /**
     
     按照age的升序排列
     age相同时，按照firstName的升序排列
     
     */
    NSSortDescriptor *ageSort = [[NSSortDescriptor alloc] initWithKey:@"age" ascending:YES];
    NSSortDescriptor *firstNameSort = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
    NSArray *sortDescriptors = @[ageSort,firstNameSort];
    
    /**
    
     fetch request描述了详细的查询规则，还可以添加查询结果的排序描述（sort descriptor）
     
     */
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.sortDescriptors = sortDescriptors;
    
    fetchRequest.entity = entity;
    
    /**
     
     在CoreData为UITableView提供数据的时候，使用NSFetchedReslutsController能提高体验，
     因为用NSFetchedReslutsController去读数据的话，能最大效率的读取数据库，也方便数据变化后更新界面
     
     */
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                        managedObjectContext:[self managedObjectContext]
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    
    self.fetchedResultsController.delegate = self;
    NSError *fetchedError = nil;
    
    /**
     *  ！！！！需要解决的问题，为什么执行这个方法？？？
     *  为什么这里使用了 performFetch:方法
     */
    if ([self.fetchedResultsController performFetch:&fetchedError]) {
        
        NSLog(@"Successfully fetched.");
    } else {
        
        NSLog(@"Failed to fetch.");
    }
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    id<NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController.sections objectAtIndex:section];
    
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = nil;
    
    static NSString *personCell = @"PersonCell";
    
    cell = [tableView dequeueReusableCellWithIdentifier:personCell];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:personCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    Person *person = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [person.firstName stringByAppendingString:person.lastName];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Age: %lu",(unsigned long)[person.age unsignedIntegerValue]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Person *person = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    self.fetchedResultsController.delegate = nil;
    
    [[self managedObjectContext] deleteObject:person];
    
    if ([person isDeleted]) {
        
        NSError *savingError = nil;
        if ([[self managedObjectContext] save:&savingError]) {
            
            NSError *fetchingError = nil;
            if ([self.fetchedResultsController performFetch:&fetchingError]) {
                
                NSLog(@"Successfully fetched");
                
                NSArray *rowsToDelete = [[NSArray alloc] initWithObjects:indexPath, nil];
                [self.tableView deleteRowsAtIndexPaths:rowsToDelete withRowAnimation:UITableViewRowAnimationAutomatic];
            } else {
                
                NSLog(@"Failed to fetch with error = %@",fetchingError);
            }
        } else {
            
            NSLog(@"Failed to save the content with error = %@",savingError);
        }
    }
    
    self.fetchedResultsController.delegate = self;
}

#pragma mark - Table view delegate

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    
    [self.tableView reloadData];
}

@end
