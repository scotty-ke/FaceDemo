//
//  BusinessObject.h
//  faceTest
//
//  Created by 宋柯 on 2021/3/28.
//  Copyright © 2021 songk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@class BusinessObject;

//是否有处理
typedef void(^CompletionBlock)(BOOL handled);

//返回事件的真正处理者
typedef void(^ResultBlock)(BusinessObject *handler,BOOL handled);



@interface BusinessObject : NSObject

//下一个响应者（响应链构成的关键）
@property (nonatomic, strong)BusinessObject *nextBusiness;

//响应者的处理方法
- (void)handle:(ResultBlock)result;

- (void)handleBusiness:(CompletionBlock)completion;


@end

NS_ASSUME_NONNULL_END
