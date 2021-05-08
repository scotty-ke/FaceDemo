//
//  ViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/8/11.
//  Copyright © 2020 songk. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSArray *VCArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSObject *object = [[NSObject alloc] init];
    
    Model *model = [[Model alloc] init];
    model.name = @"张三";
    model.num = @"1";
    
    
    _dataArray = @[@"视图响应链和事件传递",@"KVO",@"OC语言",@"blockTest",@"isKindOfClass",@"锁(信号量)",@"GCD",@"NSThread",@"hash算法",@"设计模式",@"MVC"];
    
    _VCArray = @[@"EventTransmitViewController",@"KVOViewController",@"OCViewController",@"BlockTestViewController",@"compareViewController",@"LockViewController",@"syncSerialViewController",@"NSThreadViewController",@"arithmeticViewController",@"EnteryFactoreViewController",@"MVCViewController"];
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

        [self.navigationController pushViewController:[vc new] animated:YES];
    }
}





@end
