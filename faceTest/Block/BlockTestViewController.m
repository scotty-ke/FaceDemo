//
//  BlockTestViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/9/7.
//  Copyright © 2020 songk. All rights reserved.
//

#import "BlockTestViewController.h"
#import <objc/runtime.h>

@interface BlockTestViewController ()

@property (nonatomic,copy) int(^blk)(int num);

@property (nonatomic,assign) NSInteger testNum;

@property (nonatomic,strong) NSMutableArray *testArray;

@property (nonatomic, assign) NSInteger num;

@property (nonatomic, copy)   void(^testBlock)(void);

@end

@implementation BlockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
   
    
    
//    self.testNum = 10;
//
//    self.testArray = @[@"1",@"2",@"3",@"4"].mutableCopy;
//
////    self.testNum = 20;
////
////    self.testArray = @[@"10",@"20",@"30",@"40"];
//
//    __block int first = 2;
//    void(^testBlok)(NSInteger num) = ^(NSInteger num){
//
//        NSLog(@"全局结果是%ld",first*self.testNum);
//        NSLog(@"输入结构是 %ld",num * first);
//
//    };
//
//
//
//    first = 5;
//
//    testBlok(3);
//
//
//    NSInteger weakNum = self.testNum;
//
//    NSMutableArray *weakArray = self.testArray;
//
//    self.blk = ^int(int num) {
//
//        [weakArray addObject:@"5"];
//
//        return (int)(num * weakNum);
//    };
//
//    self.testNum = 5;
    
    [self blockType];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    void(^Ablock)(void) = ^{
//
//        NSLog(@"成员变量int值 %ld",(long)self.testNum);
//
//        NSLog(@"成员变量Array值 %@",self.testArray);
//    };
//
//    Ablock();
    
    __weak typeof(self) weakSelf = self;
    
    self.testBlock = ^{
      
        __strong typeof(self) strong = weakSelf;
        
        NSLog(@"成员变量Array值 %@",strong.testArray);
    };
    
    self.testBlock();
    
//    self.blk = ^int(int num) {
//
//        NSLog(@"------- %ld",(long)self.testNum);
//
//        return self.testNum;
//    };
    
//    NSLog(@"全局结果是%d",self.blk(3));
    
    void(^block)(void) = ^{
        NSLog(@"------- %ld",(long)self.testNum);
    };
    
    block();
}

- (void)blockType
{
    int a = 0;
    

    void(^globalBlock)(void) = ^{
        
    };
    
    void(__weak ^stackBlock)(void) = ^{
        a;
    };
    
    //    MallocBlock 捕获变量并且使用强引用修饰
    void(^mallocBlock)(void) = ^{
        a;
    };
    
    self.testBlock = ^{
        
    };
    
    [self.testBlock copy];

    NSLog(@" %@\n %@\n  %@\n %@",globalBlock,stackBlock,mallocBlock,self.testBlock);
    
}


-(void)dealloc
{
    NSLog(@"dealloc");
}

@end
