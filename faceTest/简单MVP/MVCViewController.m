//
//  MVCViewController.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/13.
//  Copyright © 2021 songk. All rights reserved.
//

#import "MVCViewController.h"
#import "MVCTableViewCell.h"
#import "NDDataPresent.h"
#import "NDDataSource.h"
#import "Model.h"

static NSString *const resultID = @"resultID";

@interface MVCViewController ()

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NDDataPresent *dataPre;
@property (nonatomic, strong)NDDataSource *source;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    开始建立联系
    self.dataPre = [[NDDataPresent alloc] init];
    
    self.source = [[NDDataSource alloc] initWithIdentifier:@"testCell" configureBlock:^(MVCTableViewCell *cell, Model *model, NSIndexPath *indexPath) {
        
        cell.nameLabel.text = model.name;
        cell.numLabel.text = model.num;
        
    }];
    
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self.source;
    
    [self.source addDataArray:self.dataPre.dataArray];
    
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[MVCTableViewCell class] forCellReuseIdentifier:resultID];
        [self.view addSubview:_tableView];
    }

    return _tableView;
}


@end
