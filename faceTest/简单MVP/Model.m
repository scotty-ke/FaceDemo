//
//  Model.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/13.
//  Copyright © 2021 songk. All rights reserved.
//

#import "Model.h"

@implementation Model

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];

    if(self){
        self.name = dict[@"name"];
        self.imageUrl = dict[@"imageUrl"];
        self.num = dict[@"num"];
    }
    return self;
}

@end
