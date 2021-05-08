//
//  groupTest.h
//  faceTest
//
//  Created by 宋柯 on 2021/3/30.
//  Copyright © 2021 songk. All rights reserved.
//

#import "BaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface groupTest : BaseObject

- (void)loadLongTimeRequestWithArray:(NSArray *)array complete:(void(^)(NSString * completeString))completaBlock;

@end

NS_ASSUME_NONNULL_END
