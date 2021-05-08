//
//  groupTest.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/30.
//  Copyright © 2021 songk. All rights reserved.
//

#import "groupTest.h"

@implementation groupTest

- (void)loadLongTimeRequestWithArray:(NSArray *)array complete:(void(^)(NSString * completeString))completaBlock
{
    dispatch_queue_t queue = dispatch_queue_create("longTimeQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_t group = dispatch_group_create();
    
    for (int i = 0; i < array.count; i++) {
        
        dispatch_group_async(group, queue, ^{
           
            NSLog(@"开始第%d个任务",i);
            sleep(5);
            NSLog(@"第%d个任务结束了",i);
            
        });
    }
    
    dispatch_group_notify(group, queue, ^{
       
        NSLog(@"结束了，看看什么时候调用");
        
        if(completaBlock)
        {
            completaBlock(@"请求完了，可以去外面处理了");
        }
        
    });
}

@end
