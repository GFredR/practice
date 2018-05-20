//
//  main.m
//  iOS程序运行沙盒的路径
//
/*
 1)沙盒的基本概念和作用
 每个ios应用都有自己的应用沙盒,应用沙盒就是文件系统目录,与其他应用的文件系统隔 离,ios系统不允许访问其他应用的应用沙盒。在iOS8中已经开放访问(extension)。
 
 2)扩展阅读:
 extension是iOS8新开放的一种对几个固定系统区域的扩展机制,它可以在一定程度上弥补 iOS的沙盒机制对应用间通信的限制。
 extension的出现,为用户提供了在其它应用中使用我们应用提供的服务的便捷方式,比如用 户可以在Today的widgets中查看应用展示的简略信息,而不用再进到我们的应用中,这将是一种 全新的用户体验;但是,extension的出现可能会减少用户启动应用的次数,同时还会增大开发者 的工作量。
 
 
 3)应用沙盒一般包括以下几个文件目录:应用程序包、Documents、Libaray(下面有Caches和 Preferences目录)、tmp。
 1  应用程序包:包含所有的资源文件和可执行文件。
 2  Documents:保存应用运行时生成的需要持久化的数据,iTunes会自动备份该目录。苹果建议将程 序中建立的或在程序中浏览到的文件数据保存在该目录下,iTunes备份和恢复的时候会包括此目 录
 3  tmp:保存应用运行时所需的临时数据,使用完毕后再将相应的文件从该目录删除。应用没有运行 时,系统也有可能会清除该目录下的文件,iTunes不会同步该目录。iphone重启时,该目录下的 文件会丢失。
 4  Library:存储程序的默认设置和其他状态信息,iTunes会自动备份该目录。
 5  Libaray/Caches:存放缓存文件,iTunes不会备份此目录,此目录下文件不会在应用退出删除。一 般存放体积比较大,不是特别重要的资源。
 6  Libaray/Preferences:保存应用的所有偏好设置,ios的Settings(设置)应用会在该目录中查找 应用的设置信息,iTunes会自动备份该目录。
 
 注：第3）点应该要能完全记住
 */
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 获取沙盒根目录的方法,有以下几种: ( 应该在iOS项目里面获取 )
        
        NSString *homeDirectory = NSHomeDirectory();
        NSLog(@"%@",homeDirectory);
        
        
        /**
         NSSearchPathForDirectoriesInDomains：获得具体某一个文件夹的路径
         NSDocumentDirectory: 要需找Document文件夹
         NSUserDomainMask: 在当前用户的主目录里面来找
         YES: 是否获取全路径。NO会获得相对路径
         */
        // 第一步先用数组保存取得的路径
        NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        // 将数组元素转化为字符串
        NSString *path = [arr lastObject];
        // 显示字符串信息
        NSLog(@"arr = %@ path = %@", arr, path);
        
        
        
    }
    return 0;
}
