//
//  Adapter.h
//  faceTest
//
//  Created by 宋柯 on 2021/4/7.
//  Copyright © 2021 songk. All rights reserved.
//

#import "Adaptee.h"

NS_ASSUME_NONNULL_BEGIN

@interface Adapter : Adaptee

- (void)handleRequest;

@end

NS_ASSUME_NONNULL_END
