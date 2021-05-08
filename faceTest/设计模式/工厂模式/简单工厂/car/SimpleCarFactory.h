//
//  SimpleCarFactory.h
//  faceTest
//
//  Created by 宋柯 on 2021/3/25.
//  Copyright © 2021 songk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Car;

@interface SimpleCarFactory : NSObject

- (Car *)getCarWithCarType:(NSString *)carType;
@end

NS_ASSUME_NONNULL_END
