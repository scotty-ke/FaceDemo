//
//  Command.h
//  faceTest
//
//  Created by 宋柯 on 2021/4/7.
//  Copyright © 2021 songk. All rights reserved.
//  命令抽象类

#import <Foundation/Foundation.h>
#import "Barbecuer.h"

@interface Command : NSObject

@property (nonatomic, strong)Barbecuer *barbecuer;

- (instancetype)initWithReceiver:(Barbecuer *)boy;

- (void)excuteCommand;


@end

