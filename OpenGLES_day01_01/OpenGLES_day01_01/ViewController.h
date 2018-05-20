//
//  ViewController.h
//  OpenGLES_day01_01
//
//  Created by 郭丰锐 on 2018/3/13.
//  Copyright © 2018年 郭丰锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <OpenGLES/ES3/gl.h>
#import <OpenGLES/ES3/glext.h>
@interface ViewController : GLKViewController
{
    EAGLContext* context;//上下文
    GLKBaseEffect* mEffect;
}

@end

