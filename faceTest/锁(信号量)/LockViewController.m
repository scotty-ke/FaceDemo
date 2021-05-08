//
//  LockViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/12/21.
//  Copyright © 2020 songk. All rights reserved.
//

/*
 临界区：指的是一块对公共资源进行访问的代码，并非一种机制或是算法。

 自旋锁：是用于多线程同步的一种锁，线程反复检查锁变量是否可用。由于线程在这一过程中保持执行，因此是一种忙等待。一旦获取了自旋锁，线程会一直保持该锁，直至显式释放自旋锁。 自旋锁避免了进程上下文的调度开销，因此对于线程只会阻塞很短时间的场合是有效的。

 互斥锁（Mutex）：是一种用于多线程编程中，防止两条线程同时对同一公共资源（比如全局变量）进行读写的机制。该目的通过将代码切片成一个一个的临界区而达成。

 读写锁：是计算机程序的并发控制的一种同步机制，也称“共享-互斥锁”、多读者-单写者锁) 用于解决多线程对公共资源读写问题。读操作可并发重入，写操作是互斥的。 读写锁通常用互斥锁、条件变量、信号量实现。

 信号量（semaphore）：是一种更高级的同步机制，互斥锁可以说是semaphore在仅取值0/1时的特例。信号量可以有更多的取值空间，用来实现更加复杂的同步，而不单单是线程间互斥。

 条件锁：就是条件变量，当进程的某些资源要求不满足时就进入休眠，也就是锁住了。当资源被分配到了，条件锁打开，进程继续运行。
 */


#import "LockViewController.h"



@interface LockViewController ()

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self semaphoeTest];
    
    [self semaphoreTest2];
    
}

#pragma mark -- 信号量测试
- (void)semaphoeTest
{
//  设置最多有多少个资源可以同时访问
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    dispatch_queue_t queue = dispatch_queue_create("semaphoeQueue", 0);
    
    dispatch_async(queue, ^{
       
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        NSLog(@"run task 1");
        
        sleep(2);
        
        NSLog(@"complete task 1");
        
        dispatch_semaphore_signal(semaphore);
        
    });
    
    
    dispatch_async(queue, ^{
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
        NSLog(@"run task 2");
        
        sleep(2);
        
        NSLog(@"complete task 2");
        
        dispatch_semaphore_signal(semaphore);
    });
    
}

- (void)semaphoreTest2
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
       
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"www.baidu.com"]];
        
        NSURLSessionDownloadTask *task = [[NSURLSession sharedSession] downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSLog(@"第一步请求结束");
//            这里添加信号量，让后面的代码可以继续
            dispatch_semaphore_signal(semaphore);
            
        }];
        
        [task resume];
        
        NSLog(@"等待耗时操作结束");
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
    });
    
    dispatch_group_async(group, queue, ^{
       
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"www.baidu.com"]];
        
        NSURLSessionDownloadTask *task = [[NSURLSession sharedSession] downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSLog(@"第二步请求结束");
//            这里添加信号量，让后面的代码可以继续
            dispatch_semaphore_signal(semaphore);
            
        }];
        
        [task resume];
        
        NSLog(@"等待耗时操作结束");
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"回到主线程刷新UI");
    });
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
