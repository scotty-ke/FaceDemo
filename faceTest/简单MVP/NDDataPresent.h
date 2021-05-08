//
//  NDDataPresent.h
//  faceTest
//
//  Created by 宋柯 on 2021/4/13.
//  Copyright © 2021 songk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol PresentDelegate <NSObject>
// 需求: UI num -> model
- (void)didClickNum:(NSString *)num indexpath:(NSIndexPath *)indexpath;
- (void)reloadUI;
@end


@interface NDDataPresent : NSObject<PresentDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic, weak)id<PresentDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
