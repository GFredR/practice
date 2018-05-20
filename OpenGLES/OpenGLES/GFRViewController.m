//
//  GFRViewController.m
//  OpenGLES
//
//  Created by 郭丰锐 on 2018/4/8.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "GFRViewController.h"
@interface GFRViewController ()
@property(strong, nonatomic)EAGLContext* mContext;
@property(strong, nonatomic)GLKBaseEffect* mEffect;
@property(assign, nonatomic)int count;
@property(assign, nonatomic)float xDegree;
@property(assign, nonatomic)float yDegree;
@property(assign, nonatomic)float zDegree;

@property(assign, nonatomic)BOOL xb;
@property(assign, nonatomic)BOOL yb;
@property(assign, nonatomic)BOOL zb;
- (IBAction)xAction:(id)sender;
- (IBAction)yAction:(id)sender;
- (IBAction)zAction:(id)sender;


@end

@implementation GFRViewController
{
    dispatch_source_t timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setContext{
    //新建上下文
    self.mContext = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES2];
    //GLkView
    GLKView* view = (GLKView*)self.view;
    //参数
    view.context = _mContext;
    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    
    [EAGLContext setCurrentContext:self.mContext];
    
    glEnable(GL_DEPTH_TEST);
    
    GLfloat attrArr[] =
    {
        -0.5f, 0.5f, 0.0f,      0.0f, 0.0f, 0.5f,       0.0f, 1.0f,//左上
        0.5f, 0.5f, 0.0f,       0.0f, 0.5f, 0.0f,       1.0f, 1.0f,//右上
        -0.5f, -0.5f, 0.0f,     0.5f, 0.0f, 1.0f,       0.0f, 0.0f,//左下
        0.5f, -0.5f, 0.0f,      0.0f, 0.0f, 0.5f,       1.0f, 0.0f,//右下
        
        0.0f, 0.0f, 1.0f,       1.0f, 1.0f, 1.0f,       0.5f, 0.5f,//顶点
    };
    
    //2.绘图索引
    GLuint indices[] =
    {
        0, 3, 2,
        0, 1, 3,
        0, 2, 4,
        0, 4, 1,
        2, 3, 4,
        1, 4, 3,
    };
    
    
    self.count = sizeof(indices)/sizeof(GLuint);
    GLuint buffer;
    glGenBuffers(1, &buffer);
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    glBufferData(GL_ARRAY_BUFFER, sizeof(attrArr), attrArr, GL_STATIC_DRAW);
    
    GLuint index;
    glGenBuffers(1, &index);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, index);
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indices), indices, GL_STATIC_DRAW);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(GL_FLOAT), NULL);
    
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 3, GL_FLOAT, GL_FALSE, 8 * sizeof(GL_FLOAT), (GLfloat*)NULL+3);
    
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 8 * sizeof(GL_FLOAT), (GLfloat*)NULL+6);
    
    NSString* fPath = [[NSBundle mainBundle]pathForResource:@"cTest" ofType:@"jpg"];
    
    NSDictionary* options = [NSDictionary dictionaryWithObjectsAndKeys:@"1",GLKTextureLoaderOriginBottomLeft, nil];
    //设置
    GLKTextureInfo* textureInfo = [GLKTextureLoader textureWithContentsOfFile:fPath options:options error:nil];
    
    self.mEffect = [[GLKBaseEffect alloc]init];
    self.mEffect.texture2d0.enabled = GL_TRUE;
    self.mEffect.texture2d0.name = textureInfo.name;
    
    CGSize size = self.view.bounds.size;
    
    float aspact = fabs(size.width/size.height);
    
    GLKMatrix4 projectMatrix = GLKMatrix4MakePerspective(GLKMathDegreesToRadians(90), aspact, 0.1f, 10.0f);
    
    projectMatrix = GLKMatrix4Scale(projectMatrix, 1.0f, 1.0f, 1.0f);
    self.mEffect.transform.projectionMatrix = projectMatrix;
    
    GLKMatrix4 modelViewMatrix4 = GLKMatrix4Translate(GLKMatrix4Identity, 0.0f, 0.0f, -2.0f);
    self.mEffect.transform.modelviewMatrix = modelViewMatrix4;
    
    //定时器GCD
    double second = 0.1;
    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, second*NSEC_PER_SEC, 0.0f);
    dispatch_source_set_event_handler(timer, ^{
        self.xDegree += 0.1f* self.xb;
        self.yDegree += 0.1f* self.yb;
        self.zDegree += 0.1f* self.zb;
        
    });
    
    dispatch_resume(timer);
    
}
- (void)update{
    GLKMatrix4 modelViewMatrix4 = GLKMatrix4Translate(GLKMatrix4Identity, 0.0f, 0.0f, -2.0f);
    modelViewMatrix4 = GLKMatrix4RotateX(modelViewMatrix4, _xDegree);
    modelViewMatrix4 = GLKMatrix4RotateY(modelViewMatrix4, _yDegree);
    modelViewMatrix4 = GLKMatrix4RotateZ(modelViewMatrix4, _zDegree);
    
    self.mEffect.transform.modelviewMatrix = modelViewMatrix4;
}
- (void)glkView:(GLKView*)view drawInRect:(CGRect)rect{
    glClearColor(0.1f, 0.1f, 0.5f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    [self.mEffect prepareToDraw];
    
    //索引绘制
    glDrawElements(GL_TRIANGLES, self.count, GL_UNSIGNED_INT, 0);
}
- (void)render{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)xAction:(id)sender {
    _xb= !_xb;
}

- (IBAction)yAction:(id)sender {
    _yb =!_yb;
}

- (IBAction)zAction:(id)sender {
    _zb =! _zb;
}
@end
