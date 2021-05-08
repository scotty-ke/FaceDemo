//
//  TSLFactory.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/6.
//  Copyright © 2021 songk. All rights reserved.
//

#import "TSLFactory.h"
#import "TSLCar.h"

@implementation TSLFactory

- (void)getCar
{
    [[TSLCar alloc] init];
}

@end
