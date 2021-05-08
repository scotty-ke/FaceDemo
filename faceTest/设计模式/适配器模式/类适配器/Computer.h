//
//  Computer.h
//  faceTest
//
//  Created by 宋柯 on 2021/4/7.
//  Copyright © 2021 songk. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Adapter;
NS_ASSUME_NONNULL_BEGIN

@interface Computer : NSObject

- (void)netWithAdapter:(Adapter *)adapter;

@end

NS_ASSUME_NONNULL_END
