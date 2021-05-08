//
//  finalRequest.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/26.
//  Copyright © 2021 songk. All rights reserved.
//  对象适配器

#import "FinalRequest.h"


@implementation FinalRequest

- (void)newRequest
{
    
    [self.originRequest operation];
    
    NSLog(@"旧接口处理结束，开始新接口处理");
}


@end
