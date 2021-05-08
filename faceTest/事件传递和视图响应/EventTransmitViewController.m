//
//  EventTransmitViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/8/11.
//  Copyright © 2020 songk. All rights reserved.
//
//  一个正方形按钮，内部画一个最大的圆形，只有点在圆形范围内可以响应点击事件，其他区域不响应点击事件



#import "EventTransmitViewController.h"
#import "EventClickButton.h"

@interface EventTransmitViewController ()

@end

@implementation EventTransmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     EventClickButton *eventBtn = [[EventClickButton alloc] initWithFrame:CGRectMake(100, 100, 120, 120)];

    eventBtn.backgroundColor = [UIColor cyanColor];

    [eventBtn addTarget:self action:@selector(doAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:eventBtn];
    

}

- (void)doAction:(id)sender
{
    NSLog(@"click on the circle");
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
