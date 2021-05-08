//
//  SimpleCarFactory.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/25.
//  Copyright © 2021 songk. All rights reserved.
//

#import "SimpleCarFactory.h"
#import "Car.h"
#import "BMWCar.h"
#import "TSLCar.h"

@implementation SimpleCarFactory


/*
    静态工厂模式
    如果需要新加产品，需要修改工厂类的代码，违背了开闭原则
 */

- (Car *)getCarWithCarType:(NSString *)carType
{
    Car *car;
    
    if([carType isEqualToString:@"BMW"])
    {
        car = [[BMWCar alloc] init];
        
    }else if([carType isEqualToString:@"TSL"])
    {
        car = [[TSLCar alloc] init];
    }
    
    return car;
}


@end
