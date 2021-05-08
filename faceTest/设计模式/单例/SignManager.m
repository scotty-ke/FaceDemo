//
//  SignManager.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/26.
//  Copyright © 2021 songk. All rights reserved.
//

#import "SignManager.h"

@implementation SignManager

+(id)shareInstance
{
    static SignManager *manager = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
       
//        manager = [[SignManager alloc] init];
        
        manager = [[super allocWithZone:NULL] init];
        
    });
    
    return manager;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self shareInstance];
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    return self;
}

@end
