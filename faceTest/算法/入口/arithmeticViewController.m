//
//  arithmeticViewController.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/25.
//  Copyright © 2021 songk. All rights reserved.
//  算法

#import "arithmeticViewController.h"
#import "sortMethodViewController.h"

@interface arithmeticViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSArray *VCArray;



@end

@implementation arithmeticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self fastSort];
    [self maketableView];
    
    _dataArray = @[@"无重复字符的最长子串",@"两数之和"];
    
    _VCArray = @[@"getMaxCountSubString",@"sumObject"];
}

- (void)maketableView
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (NSArray *)dataArray
{
    if(!_dataArray)
    {
        _dataArray = [[NSArray alloc] init];
    }
    
    return _dataArray;
}

- (NSArray *)VCArray
{
    if(!_VCArray)
    {
        _VCArray = [[NSArray alloc] init];
        
    }
    
    return _VCArray;
}


#pragma mark -- tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *rid= @"cell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:rid];
    
    if(cell==nil){
        
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:rid];
        
    }

    cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *vcString = _VCArray[indexPath.row];
    
    if(vcString.length > 0)
    {
        id vc = NSClassFromString(vcString);

        [[vc alloc] init];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
