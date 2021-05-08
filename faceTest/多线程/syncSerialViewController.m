//
//  syncSerialViewController.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/15.
//  Copyright © 2021 songk. All rights reserved.
//

#import "syncSerialViewController.h"
#import "groupTest.h"


@interface syncSerialViewController ()

@property (nonatomic, strong)dispatch_queue_t concurrentQueue;

@end

@implementation syncSerialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.concurrentQueue = dispatch_queue_create("read_write_queue", DISPATCH_QUEUE_CONCURRENT);
//
//    NSLog(@"开始");
//
//    [self demo7];
//
//    NSLog(@"viewDidLoad");
    
//    dispatch_queue_t newQueue = dispatch_queue_create("newQueue", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_async(newQueue, ^{
//
//        for (int i = 0; i < 10; i++) {
//
//            [self readAction];
//
//        };
//    });
//
//    dispatch_async(newQueue, ^{
//
//        for (int i = 0; i < 5; i++) {
//            [self writeAction];
//        };
//    });
    
    [self readAction];
    
    [self writeAction];
    
    
//    多个异步任务请求
//    groupTest *groupt = [[groupTest alloc] init];
//
//    [groupt loadLongTimeRequestWithArray:@[@"1",@"2",@"3"] complete:^(NSString * _Nonnull completeString) {
//
//        NSLog(@"-----%@",completeString);
//
//    }];
    
    dispatch_async(dispatch_queue_create("label", DISPATCH_QUEUE_CONCURRENT), ^{
        
        [self demo8];
        
    });
    
    
}

- (void)demo9
{
    __block int a = 0;
    while (a<5) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            a++;
        });
    }
    
    NSLog(@"外部打印的a的值是 %d",a);
}


#pragma mark - 同步串行
//主队列添加同步任务 -- 队列循环等待 死锁
- (void)demo1
{
    dispatch_sync(dispatch_get_main_queue(), ^{
       
        NSLog(@"死锁了");
    });
}


- (void)demo2
{
    dispatch_async(dispatch_get_main_queue(), ^{
       
        NSLog(@"异步添加，不会死锁");
    });
}

//同步添加任务到新的串行队列
- (void)demo3
{
    dispatch_sync(dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL), ^{
       
        NSLog(@"不是同一个队列，不会死锁");
    });
}


#pragma mark - 同步并发

//只要是同步任务，不管是串行队列还是并发队列，都是在当前线程执行
//队列遵循FIFO 所以是按顺序执行
/*
    1-2-3-4-5 都在主线程
 */
- (void)demo4
{
    dispatch_queue_t gloubQueue = dispatch_queue_create("gloubQueue", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"1 --- %@",[NSThread currentThread]);
    dispatch_sync(gloubQueue, ^{
        NSLog(@"2 --- %@",[NSThread currentThread]);
        dispatch_sync(gloubQueue, ^{
            NSLog(@"3 --- %@",[NSThread currentThread]);
        });
        
        NSLog(@"4 --- %@",[NSThread currentThread]);
    });
    
    NSLog(@"5 --- %@",[NSThread currentThread]);
}

/*
    异步串行
 */
- (void)demo6
{
    dispatch_queue_t serialQueue = dispatch_queue_create("gloubQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1 --- %@",[NSThread currentThread]);
    dispatch_async(serialQueue, ^{
        NSLog(@"2 --- %@",[NSThread currentThread]);
//        下面如果改成同步就会死锁
/*
        因为是一个串行队列，如果添加一个同步任务，任务会等待队列上当前任务执行完成才会执行3
        但是当前任务又需要等着3执行完才算结束
        出现队列的相互等待
 */
        dispatch_async(serialQueue, ^{
            NSLog(@"3 --- %@",[NSThread currentThread]);
        });
        
        NSLog(@"4 --- %@",[NSThread currentThread]);
    });
    
    NSLog(@"5 --- %@",[NSThread currentThread]);
}

- (void)demo5
{
    dispatch_queue_t queue = dispatch_queue_create("111", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"1");
        
//  performSelector 只有有Timer的时候，才需要开启RunLoop
        [self performSelector:@selector(printLog) withObject:nil afterDelay:0];
        
//        如果没有Timer，不需要开启RunLoop也可以执行
//        [self performSelector:@selector(printLog)]
                
        [[NSRunLoop currentRunLoop] run];
        
        NSLog(@"3");
    });
    
    NSLog(@"5");
}

- (void)demo7
{
    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    
    NSLog(@"111");
    
    
    dispatch_async(dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT), ^{
       
        sleep(3);
        
        NSLog(@"耗时操作");
        
        dispatch_semaphore_signal(sem);
    });
    
    dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    
    NSLog(@"后面的操作");
    
    
}

/*
    同步栅栏和异步栅栏
 */
- (void)demo8
{
    dispatch_queue_t concurrentQueue = dispatch_queue_create("concurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue, ^{
       
        NSLog(@"------- 1");
    });
    
    
    dispatch_async(concurrentQueue, ^{
       
        NSLog(@"------- 2");
    });
    
    
    /*
     同步栅栏会阻塞主线程
     同步添加的任务都只会在当前线程执行
     
     2021-03-31 16:05:04.318320+0800 faceTest[45005:1397751] ------- 1
     2021-03-31 16:05:04.318358+0800 faceTest[45005:1398020] ------- 2
     2021-03-31 16:05:04.318613+0800 faceTest[45005:1397624] ------- 拦截
     2021-03-31 16:05:04.319137+0800 faceTest[45005:1397751] ------- 4
     2021-03-31 16:05:04.319134+0800 faceTest[45005:1398020] ------- 3
     */
    dispatch_barrier_sync(concurrentQueue, ^{

        sleep(5);
        NSLog(@"------- 拦截  %@",[NSThread currentThread]);

    });
    
  
    
    
//    异步栅栏会阻塞当前线程
//    dispatch_barrier_async(concurrentQueue, ^{
//
//        sleep(5);
//        NSLog(@"------- 异步拦截  %@",[NSThread currentThread]);
//
//    });

    dispatch_sync(concurrentQueue, ^{
       
        NSLog(@"------- 0  %@",[NSThread currentThread]);
    });

    dispatch_async(concurrentQueue, ^{
       
        NSLog(@"------- 3");
    });

    dispatch_async(concurrentQueue, ^{
       
        NSLog(@"------- 4");
    });

    
    
}


- (void)printLog
{
    NSLog(@"2");
}

#pragma mark - 栅栏函数
//利用栅栏函数实现多读单写

- (void)readAction
{
    //    因为读操作需要立刻拿到数据，所以这里任务使用同步添加方式 同步并发队列
    dispatch_sync(self.concurrentQueue, ^{
        
        NSLog(@"读数据 线程是 ==== %@",[NSThread currentThread]);
        
        sleep(2);
        
        NSLog(@"读完了 线程是 ==== %@",[NSThread currentThread]);
    });
    
}

- (void)writeAction
{
//    在写操作中使用栅栏函数进行拦截(这里用同步和异步都可以)
//    barrier 栅栏阻拦的是队列
//    栅栏函数只能用于自定义的并发队列(因为全局并发队列是全局唯一的,系统也会使用这个队列，使用栅栏会拦截系统的方法)
//
    dispatch_barrier_async(self.concurrentQueue, ^{
       
        sleep(2);
        
        NSLog(@"写操作");
    });
    
//    同步会阻塞这一句， 异步不会阻塞这一句
    NSLog(@"写操作结束了");
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
