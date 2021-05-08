//
//  abstractMachineFactory.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/25.
//  Copyright © 2021 songk. All rights reserved.
//

#import "abstractTSLFactory.h"
#import "TSLCar.h"
#import "TSLMachine.h"

@implementation abstractTSLFactory

- (TSLCar *)getCar
{
    TSLCar *car = [[TSLCar alloc] init];
    
    return car;
}

- (TSLMachine *)getMachine
{
    return [[TSLMachine alloc] init];
}


@end
