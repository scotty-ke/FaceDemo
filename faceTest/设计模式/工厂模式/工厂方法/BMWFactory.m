//
//  BMWFactory.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/6.
//  Copyright © 2021 songk. All rights reserved.
//

#import "BMWFactory.h"
#import "BMWCar.h"

@implementation BMWFactory

- (void)getCar
{
    [[BMWCar alloc] init];
}
@end
