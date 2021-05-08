//
//  Computer.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/7.
//  Copyright © 2021 songk. All rights reserved.
//

#import "Computer.h"
#import "Adapter.h"

//电脑类
@implementation Computer

- (void)netWithAdapter:(Adapter *)adapter
{
//    上网的具体实现
    [adapter handleRequest];
    
}

@end
