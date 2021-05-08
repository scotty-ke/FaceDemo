//
//  compareViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/9/8.
//  Copyright © 2020 songk. All rights reserved.
/*
 isKindOf 内部是一个循环，先判断class是否和元类相等，如果不等就去查元类的父类，看是否相等，不等就继续往上查找
 isMemberOf 判断class和自己的ISA指针比较
 */

#import "compareViewController.h"

@interface compareViewController ()

@end

@implementation compareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
