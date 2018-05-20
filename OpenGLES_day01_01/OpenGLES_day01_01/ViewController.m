//
//  ViewController.m
//  OpenGLES_day01_01
//
//  Created by 郭丰锐 on 2018/3/13.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpConfig];
    
    [self uploadVertexArray];
    
    [self uploadTexture];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)uploadTexture{
    NSString* filePath = [[NSBundle mainBundle]pathForResource:@"img-a0b279c5dbbdb648a94be0d3417d5908" ofType:@"jpg"];
    
    NSDictionary* option = [NSDictionary dictionaryWithObjectsAndKeys:@(1),GLKTextureLoaderOriginBottomLeft, nil];
    
    GLKTextureInfo* textureInfo = [GLKTextureLoader textureWithContentsOfFile:filePath options:option error:NULL];
    
    mEffect = [[GLKBaseEffect alloc]init];
    
    mEffect.texture2d0.enabled = GL_TRUE;
    
    mEffect.texture2d0.name = textureInfo.name;
}

- (void)setUpConfig{
    context = [[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (!context) {
        NSLog(@"失败");
        return;
    }
    GLKView* view = (GLKView*)self.view;
    view.context = context;
    view.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    view.drawableColorFormat = GLKViewDrawableColorFormatRGBA8888;
    [EAGLContext setCurrentContext:context];
    glEnable(GL_DEPTH_TEST);
    glClearColor(0.1, 0.2, 0.3, 1.0);
}

- (void)uploadVertexArray{
    GLfloat vertexData[] = {
        
        0.5, -0.5, 0.0f,    1.0f, 0.0f, //右下
        0.5, 0.5, -0.0f,    1.0f, 1.0f, //右上
        -0.5, 0.5, 0.0f,    0.0f, 1.0f, //左上
        
        0.5, -0.5, 0.0f,    1.0f, 0.0f, //右下
        -0.5, 0.5, 0.0f,    0.0f, 1.0f, //左上
        -0.5, -0.5, 0.0f,   0.0f, 0.0f, //左下
    };
    GLuint buffer;
    
    glGenBuffers(1, &buffer);
    
    glBufferData(GL_ARRAY_BUFFER, sizeof(vertexData), vertexData, GL_STATIC_DRAW);
    
    glBindBuffer(GL_ARRAY_BUFFER, buffer);
    
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    glVertexAttribPointer(GLKVertexAttribPosition, 3, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*5, (GLfloat*)NULL+0);
    
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(GLfloat)*5, (GLfloat*)NULL+3);
}

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect{
    glClearColor(0.3f, 0.6f, 1.0f, 1.0f);
    //清除surface内容，恢复至初始状态
    glClear(GL_DEPTH_BUFFER_BIT|GL_DEPTH_BUFFER_BIT);
    
    //启动着色器
    [mEffect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, 6);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
