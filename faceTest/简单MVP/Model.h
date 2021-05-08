//
//  Model.h
//  faceTest
//
//  Created by 宋柯 on 2021/4/13.
//  Copyright © 2021 songk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *num;

- (instancetype)initWithDict:(NSDictionary *)dict;


@end

NS_ASSUME_NONNULL_END
