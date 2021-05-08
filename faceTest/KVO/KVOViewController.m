//
//  KVOViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/8/14.
//  Copyright © 2020 songk. All rights reserved.
//
    
//  成员变量直接修改，需要手动添加KVO才能生效

/*
    KVO实现流程
    KVO是系统关于观察者模式的一种实现，运用的ISA混写技术，来动态为某一个类添加子类，，重写setter方法，并将原有类的ISA指针指向子类
 
 
    KVC流程
    1.判断是否有这个key的setter方法，有的话直接调用
    2.没有的话，判断实例变量是否存在，如果存在，直接赋值
    3.如果不存在，调用setValue:forUndefinedKey：方法，抛出NSUndefinedKeyException异常
 */

/*
    KVO KVC 监听集合类型
 
    
 [self.array addObject:@"1"];直接这样添加没办法监听
 
 需要[[self mutableArrayValueForKey:@"array"] addObject:@"1"];进行修改
 
 */

#import "KVOViewController.h"
#import "Mobject.h"
#import "Mobserver.h"
#import "NSObject+SKKVO.h"


@interface KVOViewController ()

@property (nonatomic, strong)NSMutableArray *array;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self KVOdemo1];
    
//    [self KVOdemo2];
}

- (void)KVOdemo1
{
    Mobject *obj = [[Mobject alloc] init];
    
    Mobserver *observer = [[Mobserver alloc] init];
    
    NSLog(@"---- %s",object_getClassName(obj));//Mobject
    
    [obj addObserver:observer forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:NULL];
    
    NSLog(@"---- %s",object_getClassName(obj));//在调用KVO以后，类型变成了NSKVONotifying_Mobject
    
//    obj.value = 1;
    
    [obj increase]; 
}

- (void)KVOdemo2
{
    Mobject *obj = [[Mobject alloc] init];
    
    [obj sk_addObserver:obj forKeyPath:@"value" withBlock:^(id observer, NSString *keyPath, id newValue, id oldValue) {
       
        NSLog(@"--- newValue == %@,oldValue == %@,keyPath == %@",newValue,oldValue,keyPath);
        
    }];
    
    obj.value = 1;
    
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
