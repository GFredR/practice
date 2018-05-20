//
//  AlertVC.m
//  UIAlertController


#import "AlertVC.h"

@interface AlertVC ()

@property (nonatomic, strong) UIAlertController *alertController;
@end

@implementation AlertVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIAlertView效果";
    self.view.backgroundColor = [UIColor orangeColor];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self presentViewController:self.alertController animated:YES completion:nil];
}


#pragma mark - lazy load

- (UIAlertController *)alertController
{
    if (!_alertController)
    {
        _alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
        
        /* 给 UIAlertController 添加动作按钮 */
        
        //取消按钮
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

            NSLog(@"cancel");
            //从广播中心移除该条通知
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
        }];
        
        //默认按钮
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"default" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"default");
            //从广播中心移除该条通知
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
            
        }];
        
        //警告按钮
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"destructive");
        }];
        
        
        cancelAction.enabled = YES;
        defaultAction.enabled = NO;
        
        //添加 只添加取消和默认两个按钮，效果和三个全部添加不同
        [_alertController addAction:cancelAction];
        [_alertController addAction:defaultAction];
//        [_alertController addAction:destructiveAction];
        
        
        /* 给UIAlertController 添加输入框 */
        __weak typeof(self) weakSelf = self;
        //添加账号输入框
        [_alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
            textField.placeholder = @"请输入账号";
            //增加一条广播
            [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(accountTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
        }];
        
        //添加密码输入框
        [_alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            
            textField.placeholder = @"请输入密码";
            textField.secureTextEntry = YES;
        }];
        
        
        
        
        
    }
    return _alertController;
}

/**
 *  监听账号输入框
 *
 *  @param notification <#notification description#>
 */
- (void)accountTextFieldDidChange:(NSNotification *)notification
{
    if (_alertController)
    {
        //textFields 和 actions 是数组 
        UITextField *accountTextField = _alertController.textFields[0];
        UIAlertAction *cancelAction = _alertController.actions[0];
        UIAlertAction *defaultAction = _alertController.actions[1];
        
        defaultAction.enabled = accountTextField.text.length > 2;
    }
}






@end
