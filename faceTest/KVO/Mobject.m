//
//  Mobject.m
//  faceTest
//
//  Created by 纳里健康 on 2020/8/14.
//  Copyright © 2020 songk. All rights reserved.
//

#import "Mobject.h"

@implementation Mobject


- (id)init
{
    self = [super init];
    
    if(self)
    {
        _value = 0;
    }
    
    return self;
}


//直接为成员变量赋值的时候，不能触发系统KVO监听
/*
   系统提供的KVO 重写setter方法，就是在setter方法里面添加了两句代码
    [self willChangeValueForKey:@"keyPath"];
 
    [self didChangeValueForKey:@"keyPath"];
    didChangeValueForKey会调用observeValueForKeyPath来通知监听
 */
- (void)increase
{
//    手动KVO
    [self willChangeValueForKey:@"value"];
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

@end
