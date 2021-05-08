//
//  abstractCarFactory.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/25.
//  Copyright © 2021 songk. All rights reserved.
//

#import "abstractBMWFactory.h"
#import "BMWCar.h"
#import "BMWMachine.h"

@implementation abstractBMWFactory

- (BMWCar *)getCar
{
    BMWCar *car = [[BMWCar alloc] init];
    
    return car;
}

- (BMWMachine *)getMachine
{
    BMWMachine *machine = [[BMWMachine alloc] init];
    
    return machine;
}

@end
