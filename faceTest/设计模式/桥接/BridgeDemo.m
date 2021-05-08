//
//  BridgeDemo.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/28.
//  Copyright © 2021 songk. All rights reserved.
//

#import "BridgeDemo.h"
#import "ShowDataView.h"

#import "consultDataView.h"
#import "followDataView.h"

#import "consultObject.h"
#import "followUpObject.h"

@interface BridgeDemo()

@property(nonatomic,strong)ShowDataView *dataView;

@end

@implementation BridgeDemo

- (void)fachData
{
    self.dataView = [[consultDataView alloc] init];
    
    BaseObject *consultObj = [[consultObject alloc] init];
    
    self.dataView.dataObject = consultObj;
    
    [self.dataView dataHandle];
    
}

@end
