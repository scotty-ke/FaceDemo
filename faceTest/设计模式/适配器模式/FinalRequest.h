//
//  finalRequest.h
//  faceTest
//
//  Created by 宋柯 on 2021/3/26.
//  Copyright © 2021 songk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OriginalRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface FinalRequest : NSObject

//被适配对象
@property (nonatomic, strong) OriginalRequest *originRequest;

- (void)newRequest;


@end

NS_ASSUME_NONNULL_END
