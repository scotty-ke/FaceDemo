//
//  Waiter.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/7.
//  Copyright © 2021 songk. All rights reserved.
//

#import "Waiter.h"
#import "Command.h"

@interface Waiter()

@property(nonatomic, strong)NSMutableArray<Command *> *commandArray;

@end

@implementation Waiter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.commandArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addOrder:(Command *)cmd
{
    [self.commandArray addObject:cmd];
    
}

- (void)cancelOrder:(Command *)cmd
{
    if([self.commandArray containsObject:cmd])
    {
        [self.commandArray removeObject:cmd];
    }
}

- (void)notify
{
    for (Command *cmd in self.commandArray) {
        
        [cmd excuteCommand];
    }
}

@end
