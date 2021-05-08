//
//  abstractFactory.h
//  faceTest
//
//  Created by 宋柯 on 2021/3/25.
//  Copyright © 2021 songk. All rights reserved.
//  可以理解为定义一个协议，约束其他人需要生产的产品

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Machine.h"

NS_ASSUME_NONNULL_BEGIN

@interface abstractFactory : NSObject

- (Car *)getCar;

- (Machine *)getMachine;

@end

NS_ASSUME_NONNULL_END
