//
//  NSOperationViewController.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/15.
//  Copyright © 2021 songk. All rights reserved.
//  和RunLoop一起使用 实现常驻线程

#import "NSThreadViewController.h"

@interface NSThreadViewController ()

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     NSThread start函数内部创建一个pThread线程以后，就会调用一个main函数，main函数内部会通过performSelector来调用外部传入的selector，然后就会调用NSThread 的exit函数。所以我们可以在selector维护一个事件循环，来实现常驻线程
     */
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadTest) object:nil];
    
    [thread setName:@"keepAliveThread"];
    
    [thread start];
    
    
    [self performSelector:@selector(logTest) onThread:thread withObject:nil waitUntilDone:NO];
    
}

- (void)threadTest
{
    @autoreleasepool {
        
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        
        [runloop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        
        [runloop run];
        
    }
}

- (void)logTest
{
    NSLog(@"开始log");
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
