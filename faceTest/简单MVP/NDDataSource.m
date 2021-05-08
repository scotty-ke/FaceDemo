//
//  NDDataSource.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/13.
//  Copyright © 2021 songk. All rights reserved.
//

#import "NDDataSource.h"

@implementation NDDataSource

- (id)initWithIdentifier:(NSString *)identifier configureBlock:(cellConfigureBeforeBlock)block
{
    if(self = [super init])
    {
        _cellIdentifier = identifier;
        _cellConfigureBlock = block;
    }
    
    return self;
}

- (void)addDataArray:(NSArray *)datas
{
    if(!datas) return;
    
    if(self.dataArray.count > 0)
    {
        [self.dataArray removeAllObjects];
    }
    
    [self.dataArray addObjectsFromArray:self.dataArray];
}

- (id)modelAtIndexPath:(NSIndexPath *)indexPath
{
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count > 0 ? self.dataArray.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    id model = [self modelAtIndexPath:indexPath];
    
    if(self.cellConfigureBlock)
    {
        self.cellConfigureBlock(cell, model, indexPath);
    }
    
    return cell;
}

@end
