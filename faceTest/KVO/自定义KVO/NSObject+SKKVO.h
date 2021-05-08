//
//  NSObject+SKKVO.h
//  自定义KVO
//
//  Created by 纳里健康 on 2018/6/14.
//  Copyright © 2018年 songK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SKKVOBlock)(id observer,NSString *keyPath,id newValue,id oldValue);

@interface NSObject (SKKVO)

- (void)sk_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath withBlock:(SKKVOBlock)block;
@end
