//
//  ViewController.m


#import "ViewController.h"
#import <NotificationCenter/NotificationCenter.h>

#define GROUP_ID (@"group.MKTodyExtension")
#define TODO_LIST_ID (@"todoListID")

NSString *CellId = @"cellId";

#define NEW_TODO_NOTI (@"addNewTodoNoti")

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray<NSString *> *todoList;
    
    UIAlertController *todoAlertCtrl;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    todoList = [self getToDoSnapshot].mutableCopy;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: CellId];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNewTodo:) name:NEW_TODO_NOTI object:nil];
}

#pragma mark - 更新 group 数据
- (void)updateTodoSnapshot
{
    NSUserDefaults *infoDic = [[NSUserDefaults alloc] initWithSuiteName: GROUP_ID];
    [infoDic setObject:todoList forKey:TODO_LIST_ID];
    [infoDic synchronize];
    
    //更新今日面板信息，NotificationCenter framework
    [[NCWidgetController widgetController] setHasContent:YES forWidgetWithBundleIdentifier:@"com.donlinks.MKTodyExtension.MKTodayTarget"];
}

#pragma mark - 获取 group 数据
- (NSArray<NSString *> *)getToDoSnapshot{
    NSUserDefaults *infoDic = [[NSUserDefaults alloc] initWithSuiteName: GROUP_ID];
    NSArray<NSString *> *array = [infoDic objectForKey: TODO_LIST_ID];
    return (array? array: @[]);
}

- (void)addNewTodo:(NSNotification *)noti
{
    NSString *identifier = [noti.userInfo objectForKey:@"id"];
    if([identifier isEqualToString:@"new_item"]){
        [self addTodo:nil];
    }else{
        NSInteger index = identifier.integerValue;
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    }
}

#pragma mark - 添加 ToDo
- (IBAction)addTodo:(id)sender {
    if(!todoAlertCtrl){
        todoAlertCtrl = [UIAlertController alertControllerWithTitle:@"添加ToDo" message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UITextField *textFiled = todoAlertCtrl.textFields[0];
            NSString *text = textFiled.text;
            [todoList addObject:text];
            [self updateTodoSnapshot];
            
            [self.tableView beginUpdates];
            [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:(todoList.count-1) inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView endUpdates];
            
            textFiled.text = nil;
        }];
        
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [todoAlertCtrl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"输入内容";
        }];
        
        [todoAlertCtrl addAction:actionConfirm];
        [todoAlertCtrl addAction:actionCancel];
    }
    
    [self presentViewController:todoAlertCtrl animated:YES completion:nil];
}

#pragma mark - tableView delegate and datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return todoList.count;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault
                                                                      title:@"删除"
                                                                    handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
                                                                        
                                                                        [todoList removeObjectAtIndex:indexPath.row];
                                                                        [self updateTodoSnapshot];
                                                                        
                                                                        [tableView beginUpdates];
                                                                        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
                                                                        [tableView endUpdates];
                                                                    }];
    action.backgroundColor = [UIColor redColor];
    
    return @[action];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    
    cell.textLabel.text = todoList[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
