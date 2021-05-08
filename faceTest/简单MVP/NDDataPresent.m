//
//  NDDataPresent.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/13.
//  Copyright © 2021 songk. All rights reserved.
//

#import "NDDataPresent.h"
#import <UIKit/UIKit.h>
#import "Model.h"

@implementation NDDataPresent

- (instancetype)init
{
    if(self = [super init])
    {
        [self loadData];
    }
    return self;
}

- (void)loadData
{
    NSArray *temArray =
    @[
      @{@"name":@"Hank",@"imageUrl":@"http://Hank",@"num":@"99"},
      @{@"name":@"Kody",@"imageUrl":@"http://Kody",@"num":@"99"},
      @{@"name":@"CC",@"imageUrl":@"http://CC",@"num":@"99"},
      @{@"name":@"Cooci",@"imageUrl":@"http://Cooci",@"num":@"59"},
      @{@"name":@"Lina",@"imageUrl":@"http://Lina",@"num":@"24"},
    @{@"name":@"婷婷",@"imageUrl":@"http://婷婷",@"num":@"12"},
    @{@"name":@"小雁子",@"imageUrl":@"http://小雁子",@"num":@"17"},
    @{@"name":@"湘湘",@"imageUrl":@"http://湘湘",@"num":@"18"},
    @{@"name":@"萱萱",@"imageUrl":@"http://萱萱",@"num":@"16"},
    @{@"name":@"豆豆",@"imageUrl":@"http://豆豆",@"num":@"25"},
    @{@"name":@"南汐",@"imageUrl":@"http://南汐",@"num":@"19"},
    @{@"name":@"子昂",@"imageUrl":@"http://波比",@"num":@"19"},
    @{@"name":@"奇奇",@"imageUrl":@"http://奇奇",@"num":@"19"}];

    for (int i = 0; i<temArray.count; i++) {
        Model *m = [[Model alloc] initWithDict:temArray[i]];
        [self.dataArray addObject:m];
    }
}

#pragma mark -PresentDelegate
- (void)didClickNum:(NSString *)num indexpath:(NSIndexPath *)indexpath{
    
    if (indexpath.row < self.dataArray.count) {
        
        Model *model = self.dataArray[indexpath.row];
        model.num    = num;
        
        if ([num intValue] > 5) {
            
            [self.dataArray removeAllObjects];
            
            NSArray *temArray =
            @[
              @{@"name":@"Hank",@"imageUrl":@"http://Hank",@"num":@"99"},
              @{@"name":@"Kody",@"imageUrl":@"http://Kody",@"num":@"99"},
              @{@"name":@"CC",@"imageUrl":@"http://CC",@"num":@"99"},
              @{@"name":@"Cooci",@"imageUrl":@"http://Cooci",@"num":@"59"},
              @{@"name":@"Lina",@"imageUrl":@"http://Lina",@"num":@"24"},
            @{@"name":@"婷婷",@"imageUrl":@"http://婷婷",@"num":@"12"}];

            for (int i = 0; i<temArray.count; i++) {
                Model *m = [[Model alloc] initWithDict:temArray[i]];
                [self.dataArray addObject:m];
            }
            
            // model - delegate -> UI
            if (self.delegate && [self.delegate respondsToSelector:@selector(reloadUI)]) {
                [self.delegate reloadUI];
            }
            
        }
        
    }
    
    
    
    
}


- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _dataArray;
}


@end
