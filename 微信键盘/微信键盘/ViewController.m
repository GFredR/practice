//
//  ViewController.m
//  微信键盘
//
//  Created by 郭丰锐 on 2018/1/24.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

#define TEXTVIEWTAG 666
#define INPUTTAG 777

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* inputView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.frame)-40, CGRectGetWidth(self.view.frame), 40)];
    inputView.tag = INPUTTAG;
    inputView.backgroundColor = [UIColor blackColor];
    UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 5, 0.7*inputView.frame.size.width, 30)];
    textView.layer.cornerRadius = 5;
    textView.tag = TEXTVIEWTAG;
    [inputView addSubview:textView];
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(textView.frame.origin.x+textView.frame.size.width+20, 5, 0.2*inputView.frame.size.width, 30)];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    btn.layer.cornerRadius = 5;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchDown];
    [inputView addSubview:btn];
    
    [self.view addSubview:inputView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShowAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHiddenAction:) name:UIKeyboardWillHideNotification object:nil];
    //
    [textView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"Keypath:%@",keyPath);
    NSLog(@"change:%@",change);
    NSValue* value = change[@"new"];
    CGSize size;
    [value getValue:&size];
    CGFloat newHeight = size.height;
    
    NSValue* oldValue = change[@"old"];
    CGSize oldSize;
    [oldValue getValue:&oldSize];
    CGFloat oldHeight = oldSize.height;
    
    CGFloat height = fabs(newHeight - oldHeight) ;
    UITextView* textView = [self.view viewWithTag:TEXTVIEWTAG];
    UIView* inputView = [self.view viewWithTag:INPUTTAG];
    [self updateUIFrame:textView height:height];
    [self updateUIFrame:inputView height:height];
}

- (void)updateUIFrame:(UIView*)view height:(CGFloat)height{
    CGRect frame = view.frame;
    frame.size.height += height;
    frame.origin.y -= height;
    view.frame = frame;
}

- (void)keyBoardWillShowAction:(NSNotification*)sender{
    NSLog(@"show:sender:%@",[sender userInfo]);
    [self moveInputViewUp:YES userDic:sender.userInfo];
    //更新inputViewd的frame
    
    
    
    
    
    
}

- (void)keyBoardWillHiddenAction:(NSNotification*)sender{
    NSLog(@"hidden:sender:%@",[sender userInfo]);
    [self moveInputViewUp:NO userDic:sender.userInfo];
    //更新inputViewd的frame
    
    
    
}

- (void)moveInputViewUp:(BOOL)isUp userDic:(NSDictionary*)userInfoDic{
    NSTimeInterval timeInterval = [userInfoDic[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    NSValue* boundsValue = userInfoDic[@"UIKeyboardBoundsUserInfoKey"];
    CGRect keyBoardBounds;
    [boundsValue getValue:&keyBoardBounds];
    
    NSLog(@"height:%g",keyBoardBounds.size.height);
    
    UIView* inputView = [self.view viewWithTag:INPUTTAG];
    if (isUp) {
        [UIView animateWithDuration:timeInterval animations:^{
            CGPoint center = inputView.center;
            center.y -= keyBoardBounds.size.height;
            inputView.center = center;
        }];
    }else{
        [UIView animateWithDuration:timeInterval animations:^{
            CGPoint center = inputView.center;
            center.y += keyBoardBounds.size.height;
            inputView.center = center;
        }];
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITextView* textView = [self.view viewWithTag:TEXTVIEWTAG];
    [textView resignFirstResponder];
}

- (void)btnAction:(UIButton*)sender{
    NSLog(@"发送");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
