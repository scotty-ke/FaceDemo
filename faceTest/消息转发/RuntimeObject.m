//
//  RuntimeObject.m
//  faceTest
//
//  Created by 纳里健康 on 2020/8/17.
//  Copyright © 2020 songk. All rights reserved.


//  消息转发流程 resolveInstanceMethod(NO) -> forwardingTargetForSelector -> methodSignatureForSelector -> forwardInvocation

#import "RuntimeObject.h"
#import <objc/runtime.h>


@implementation RuntimeObject

void testIMP(void)
{
    NSLog(@"test Method");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    
    if(sel == @selector(test))
    {
        NSLog(@"resolveInstanceMethod:");
//        这里应该返回yes,因为已经查找到方法了，但是为了看后续调用，暂时返回NO
        
        class_addMethod(self, @selector(test), testIMP, "v@:");
        
        return NO;
    }else
    {
        return [super resolveInstanceMethod:sel];
    }
    
/*
 Runtime动态添加方法
 class_addMethod(<#Class  _Nullable __unsafe_unretained cls#>, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
 四个参数
 1.为谁添加参数
 2.添加方法的选择器名称
 3.方法的具体实现
 4.方法对象的返回值 参数，以及参数类型等 v@:(v:返回值为void @ 代表默认参数self ：代表方法选择器) 
 */

    
    
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
//    如果这里指定了一个转发目标即返回值不是nil 系统会将该消息发送给指定的目标
//    如果没有返回，就调用签名方法
    NSLog(@"forwardingTargetForSelector");
    
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if(aSelector == @selector(test))
    {
        NSLog(@"methodSignatureForSelector");
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else
    {
        return [super methodSignatureForSelector:aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"forwardInvocation");
}

@end
