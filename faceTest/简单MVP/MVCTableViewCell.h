//
//  MVCTableViewCell.h
//  faceTest
//
//  Created by 宋柯 on 2021/4/13.
//  Copyright © 2021 songk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDDataPresent.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVCTableViewCell : UITableViewCell
@property (nonatomic, strong) UIButton *subBtn;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UIButton *addBtn;
@property (nonatomic, assign) int num;
@property (nonatomic, strong) NSIndexPath *indexPath;



@end

NS_ASSUME_NONNULL_END
