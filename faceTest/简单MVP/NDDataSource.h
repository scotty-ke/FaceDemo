//
//  NDDataSource.h
//  faceTest
//
//  Created by 宋柯 on 2021/4/13.
//  Copyright © 2021 songk. All rights reserved.
//  这里封装tableView的DataSource

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^cellConfigureBeforeBlock)(id cell,id model,NSIndexPath *indexPath);

@interface NDDataSource : NSObject<UITableViewDataSource>

//记录数据源
@property (nonatomic, strong)NSMutableArray *dataArray;

@property (nonatomic, copy)cellConfigureBeforeBlock cellConfigureBlock;

@property (nonatomic, strong)NSString *cellIdentifier;

//自定义初始化方法
- (id)initWithIdentifier:(NSString *)identifier configureBlock:(cellConfigureBeforeBlock)block;


//添加数据源，显示的时候需要数据源
- (void)addDataArray:(NSArray *)datas;



@end


