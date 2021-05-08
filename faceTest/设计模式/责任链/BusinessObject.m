//
//  BusinessObject.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/28.
//  Copyright © 2021 songk. All rights reserved.
//

#import "BusinessObject.h"

@implementation BusinessObject

- (void)handle:(ResultBlock)result
{
    CompletionBlock completionBlock = ^(BOOL handled){
        
        if(handled)
        {
            result(self,handled);
        }else
        {
//            沿着责任链，指派给下一个业务处理
            if(self.nextBusiness){
                
                [self.nextBusiness handle:result];
            }else
            {
//                责任链没有下一个，没人处理，上抛
                result(nil,NO);
            }
        }
        
    };
    
    [self handleBusiness:completionBlock];
}

- (void)handleBusiness:(CompletionBlock)completion
{
//    这里做自己的业务处理 子类重写
    
//    业务处理完以后，调用回调
    
}

@end
