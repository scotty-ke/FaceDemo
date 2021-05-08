//
//  Mobserver.m
//  faceTest
//
//  Created by 纳里健康 on 2020/8/14.
//  Copyright © 2020 songk. All rights reserved.
//

#import "Mobserver.h"

@implementation Mobserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
//    这里做监听操作
    NSLog(@"---newKey = %@",[change valueForKey:NSKeyValueChangeNewKey]);
    
}

@end
