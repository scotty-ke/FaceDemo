//
//  Waiter.h
//  faceTest
//
//  Created by 宋柯 on 2021/4/7.
//  Copyright © 2021 songk. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Command;

@interface Waiter : NSObject

- (void)addOrder:(Command *)cmd;

- (void)cancelOrder:(Command *)cmd;

- (void)notify;
@end

