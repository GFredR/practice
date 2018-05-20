//
//  ViewController.m
//  猜图游戏
//
//  Created by 郭丰锐 on 2017/8/5.
//  Copyright © 2017年 郭丰锐. All rights reserved.
//

#import "ViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define AnswerBtnBasicTag 100
#define WordsBtnBasicTag 200
@interface ViewController ()
@property (strong, nonatomic)UIImageView* imageView;//放图片
@property (assign, nonatomic)NSInteger taskNumber;//记录当前关卡
@property (strong, nonatomic)NSString* currentAnswer;//记录当前答案
@property (assign, nonatomic)NSInteger wordTimes;//记录当前选中是第几次选择按钮
@property (assign, nonatomic)NSInteger totalTask;//记录当前设置了多少关
- (void)readFileWithNumner:(NSInteger)number;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.taskNumber = 1;
    self.totalTask = 3;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.imageView];
    [self createAnswerButtons];
    [self createSelectorButtons];
    [self readFileWithNumner:1]; 
    //获取沙盒路径path
    NSString* homePath = NSHomeDirectory();
    NSLog(@"%@",homePath);
    //获取路径的组成部分
    NSArray* arrPath = [homePath pathComponents];
    for(id str in arrPath){
        NSLog(@"%@",str);
    }
    //获取最后一部分
    NSString* lastPath = [homePath lastPathComponent];
    NSLog(@"%@",lastPath);
    //追加目录或者文件到path末尾
    NSString* newPath = [homePath stringByAppendingPathComponent:@"Document/flie.txt"];
    NSLog(@"%@",newPath);
    //
    NSString* filePath = [newPath stringByDeletingLastPathComponent];
    NSLog(@"%@",filePath);
    //扩展名
    NSString* exten = [newPath pathExtension];
    NSLog(@"%@",exten);
    //追加扩展名
    NSString* fileNewPath = [filePath stringByAppendingPathExtension:@".jpg"];
    NSLog(@"%@",fileNewPath);
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark- 答案相关
- (void)gameOver{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"已经通关" message:@"恭喜你，已经通关" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //回调
        //self.taskNumber = 1;
    }];
    [alert addAction:alertAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)readFileWithNumner:(NSInteger)number{
    self.wordTimes = 0;
    //self.totalTask++;
    if (number > self.totalTask) {
        [self gameOver];
        self.taskNumber = 1;
    }
    //把所有隐藏的按钮显示
    for (id value in self.view.subviews) {
        if ([value isKindOfClass:[UIView class]] && [value isHidden]) {
            [value setHidden:NO];
        }
        if ([value tag ]>=AnswerBtnBasicTag && [value tag]<=AnswerBtnBasicTag+3) {
            [value setTitle:@"" forState:UIControlStateNormal];
        }
    }
    NSString* fileName = [NSString stringWithFormat:@"%ld",self.taskNumber];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSDictionary* fileDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    //记录当前答案
    self.currentAnswer = fileDic[@"answer"];
    //读取当前关卡可使用的词
    NSArray* words = fileDic[@"words"];
    //读取当前关卡图片
    NSString* imageName = fileDic[@"imageName"];
    self.imageView.image = [UIImage imageNamed:imageName];
    [self fillWordsBtns:words];
}
- (void)fillWordsBtns:(NSArray*)words{
   // NSInteger k = 0;
    for (NSInteger i = 0; i<24; i++) {
        UIButton* btn = [self.view viewWithTag:WordsBtnBasicTag+i];
        NSString* tittle = words[i];
        [btn setTitle:tittle forState:UIControlStateNormal];
    }
    
}

#pragma mark- ui搭建
- (UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, ScreenWidth-100, ScreenHeight/3)];
        //_imageView.image = [UIImage imageNamed:@"images/01.jpg"];
    }
    self.view.backgroundColor = [UIColor lightGrayColor];
    return _imageView;
}

- (void)createAnswerButtons{
    CGFloat btnWidth = (self.imageView.frame.size.width+20)/4-20;
    for (NSInteger i = 0; i<4; i++) {
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(self.imageView.frame.origin.x+(btnWidth+20)*i, self.imageView.frame.origin.y + self.imageView.frame.size.height+20, btnWidth, btnWidth)];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(revokeAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = AnswerBtnBasicTag+i;
        [btn setBackgroundImage:[UIImage imageNamed:@"backgroundImage"] forState:UIControlStateNormal];
        [self.view addSubview:btn];
    }
}
- (void)createSelectorButtons{
    
    UIButton* answerButton = [self.view viewWithTag:AnswerBtnBasicTag];
    CGFloat btnWidth = (ScreenWidth-10)/6-10;
    CGFloat btnHeight = btnWidth;
    NSInteger k = 0;
    for (NSInteger i = 0; i<4; i++) {
        for (NSInteger j = 0; j<6; j++) {
            UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
            //[btn setBackgroundColor:[UIColor cyanColor]];
            [btn setBackgroundImage:[UIImage imageNamed:@"backgroundImage"] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [btn setFrame:CGRectMake(10+(btnWidth+10)*j, (btnHeight+10)*i+answerButton.frame.origin.y + CGRectGetHeight(answerButton.frame)+20, btnWidth, btnHeight)];
            btn.tag = WordsBtnBasicTag+k++;
            [btn addTarget:self action:@selector(wordsBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
        }
    }
}
#pragma mark-  交互相关
- (void)wordsBtnAction:(UIButton*)sender{
    //self.wordTimes++;
    //获取按钮当前标题
    NSString* word = sender.currentTitle;
    UIButton* answerBtn = [self.view viewWithTag:AnswerBtnBasicTag+self.wordTimes++];
    
    [answerBtn setTitle:word forState:UIControlStateNormal];
    //设置好tittle之后再查看答案
    if (self.wordTimes == 4) {
        [self judgeAnswer];
    }
    sender.hidden = YES;
}
- (void)judgeAnswer{
    NSString* answer = @"";
    //查找4个答案按钮
    for (NSInteger i = 0; i<4; i++) {
        UIButton* btn = [self.view viewWithTag:AnswerBtnBasicTag+i];
        answer = [answer stringByAppendingString:btn.currentTitle];
    }
    if ([answer isEqualToString:self.currentAnswer]) {
        //正确，进入下一关
        [self answerRight:YES];
        
    }else{
        //错误，清空答案按钮，times置零,隐藏按钮重新显示
        [self answerRight:NO];
    }
}
- (void)answerRight:(BOOL)right{
    NSString* alertTittle = @"Right";
    NSString* alertMessege = @"恭喜正确，请进入下一关";
    if (!right) {
        alertTittle = @"Worng";
        alertMessege = @"很抱歉，答错了";
    }
    UIAlertController* control = [UIAlertController alertControllerWithTitle:alertTittle message:alertMessege preferredStyle:UIAlertControllerStyleAlert];
    __weak ViewController* weakSelf = self;
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"继续" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //进入下一关代码，重置所有答案按钮、图片、清空答案、次数置为零
        if (!right) {
            [weakSelf readFileWithNumner:self.taskNumber];
        }else{
            [weakSelf readFileWithNumner:++self.taskNumber];
        }
        
    }];
    //显示提示框
    [self presentViewController:control animated:YES completion:nil];
    [control addAction:action];
}
- (void)revokeAction:(UIButton*)sender{
    if (self.wordTimes<= 0) {
        return;
    }
    self.wordTimes--;
    //获取当前按钮点击的标题
    NSString* currentTittle = sender.currentTitle;
    for (NSInteger i = 0; i < 24; i++) {
        UIButton* btn = [self.view viewWithTag:WordsBtnBasicTag+i];
        if ([btn.currentTitle isEqualToString:currentTittle]) {
            btn.hidden = NO;
        }
    }
    [sender setTitle:@"" forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
