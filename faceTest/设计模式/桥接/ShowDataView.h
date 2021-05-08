//
//  ShowDataView.h
//  faceTest
//
//  Created by 宋柯 on 2021/3/28.
//  Copyright © 2021 songk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseObject.h"
NS_ASSUME_NONNULL_BEGIN

@interface ShowDataView : NSObject

@property (nonatomic, strong)BaseObject *dataObject;

- (void)dataHandle;

@end

NS_ASSUME_NONNULL_END
