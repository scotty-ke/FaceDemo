//
//  NSObject+SKKVO.m
//  自定义KVO
//
//  Created by 纳里健康 on 2018/6/14.
//  Copyright © 2018年 songK. All rights reserved.
//  https://www.bilibili.com/video/BV1TW411g7Rx?from=search&seid=12408181322015449096

#import "NSObject+SKKVO.h"
#import <objc/message.h>

static NSString *const SKKVOPre = @"SKKVO_";

@implementation NSObject (SKKVO)

- (void)sk_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath withBlock:(SKKVOBlock)block
{
    /*
        1、动态创建子类
        2、设置setter 方法
        3、消息转发
     */
    
    SEL setterSelect = NSSelectorFromString(setterNameFromGetter(keyPath));
    
    Method setterMethod = class_getInstanceMethod(object_getClass(self), setterSelect);
    
    if(!setterMethod)
    {
        @throw [NSException exceptionWithName:NSInvalidArgumentException reason:[NSString stringWithFormat:@"%@ 没有set方法",keyPath] userInfo:nil];
    }
    
    //1.动态创建子类
    NSString *supreClassName = NSStringFromClass([self class]);
    
    [self createClassFromSuperClass:supreClassName];
    
}


#pragma mark -- 动态生成子类
- (Class)createClassFromSuperClass:(NSString *)superName
{
    Class superClass = NSClassFromString(superName);
    
    
    //在父类前面添加一个前缀 作为新类的名字
    NSString *newClassName = [SKKVOPre stringByAppendingString:superName];
    
    /**
     动态生成子类的方法
     superClass 父类
     name 子类名称
     extraBytes 内存空间
     */
    Class newClass = objc_allocateClassPair(superClass, newClassName.UTF8String, 0);
    
    //添加class
    Method class_method = class_getClassMethod(superClass, @selector(class));
    
    const char *type = method_getTypeEncoding(class_method);
    
    /*
     添加方法
     */
    class_addMethod(newClass, @selector(class), (IMP)SKKVC_Class, type);
    
    //注册类
    objc_registerClassPair(newClass);
    
    return newClass;
}


#pragma mark -- C 函数

static Class SKKVC_Class(id self){
    
    return class_getSuperclass(object_getClass(self));
    
}




//根据传进来的kayPath 拼接set方法名 name --> setName
static NSString * setterNameFromGetter(NSString * getterName)
{
    if(getterName.length <= 0){return nil;}
    
    //把传进来的属性名字第一个字母大写
    NSString *firstSubString = [[getterName substringToIndex:1] uppercaseString];
    
    NSString *otherSubSstring = [getterName substringFromIndex:1];
    
    return [NSString stringWithFormat:@"set%@%@:",firstSubString,otherSubSstring];
}

static NSString * getterNameFromSetter(NSString * setterName)
{
    if(setterName.length <= 0 || ![setterName hasPrefix:@"set"]){return nil;}
    
    //根据set方法获取属性名 setName: --> name
    NSString *proString = [setterName substringWithRange:NSMakeRange(3, setterName.length - 1)];

    //把获取属性名字第一个字母大写
    NSString *firstSubString = [[proString substringToIndex:1] lowercaseString];
    
    NSString *otherSubSstring = [proString substringFromIndex:1];
    
    return [NSString stringWithFormat:@"%@%@:",firstSubString,otherSubSstring];
}



@end
