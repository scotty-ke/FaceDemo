//
//  Command.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/7.
//  Copyright © 2021 songk. All rights reserved.
//

#import "Command.h"

@implementation Command

- (instancetype)initWithReceiver:(Barbecuer *)boy
{
    if(self = [super init])
    {
//        绑定命令接收者
        self.barbecuer = boy;
    }
    
    return self;
}

@end
