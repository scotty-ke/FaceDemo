//
//  sumObject.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/15.
//  Copyright © 2021 songk. All rights reserved.
//

#import "sumObject.h"

@implementation sumObject

- (void)runMethod
{
//    [self findTwoIndexAtArray:@[@(2),@(7),@(11),@(15)] withTarget:9];
//
//    [self findTwoIndexAtArray:@[@(3),@(11),@(3),@(15)] withTarget:6];
    
    [self xorOperationWithCount:4 start:3];
    
}

- (void)findTwoIndexAtArray:(NSArray *)array withTarget:(NSInteger)target
{
    
    NSMutableArray *comArray = array.mutableCopy;
    
    
    for (int i = 0; i < array.count; i ++) {
        
        [comArray removeObjectAtIndex:0];
        
        NSInteger num1 = [array[i] integerValue];
        
        NSInteger num2 = target - num1;
        
        if([comArray containsObject:@(num2)])
        {
            NSInteger index = [comArray indexOfObject:@(num2)] + i + 1;
            
            if(index != i)
            {
                NSLog(@"index1 = %d,index2 = %ld",i,(long)index);
            }
        }
        
        
    }
}

//数组异或操作
- (void)xorOperationWithCount:(int)count start:(int)start
{
    int result = 0;
    
    for (int i = 0; i < count; i++) {
        
        int num = start + 2 * i;
        
        result ^= num;
    }
    
    NSLog(@"result === %d",result);
}

//反转整数
- (void)revistNum:(int)num
{
    NSUInteger result = 0;
    
    while (num != 0) {
        
//        取出来最后一位
        NSUInteger end = num % 10;
        
//        将上次取出来的结构乘以10并加上最后以后
        result = result * 10 + end;
        
//        取出前面的几位（除了最后一位）
        num = num/10;
    }
        
    if(result <= INT32_MAX && result >= -INT32_MAX - 1)
    {
        NSLog(@"结果是 %lu",(unsigned long)result);
    }
}

@end
