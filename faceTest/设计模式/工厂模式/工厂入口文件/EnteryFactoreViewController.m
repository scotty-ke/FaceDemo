//
//  EnteryFactoreViewController.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/25.
//  Copyright © 2021 songk. All rights reserved.
//

#import "EnteryFactoreViewController.h"
#import "SimpleCarFactory.h"

#import "abstractFactory.h"
#import "abstractBMWFactory.h"
#import "abstractTSLFactory.h"

//工厂方法
#import "BMWFactory.h"
#import "TSLFactory.h"

//对象适配器
#import "FinalRequest.h"
#import "OriginalRequest.h"

#import "Computer.h"
#import "Adapter.h"

//命令模式
#import "Command.h"
#import "BakeChickenCommand.h"
#import "BakeMuttonCommand.h"
#import "Barbecuer.h"
#import "Waiter.h"


@interface EnteryFactoreViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
    NSArray *_dataArray;
    
    NSArray *_VCNameArray;
}

@end

@implementation EnteryFactoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self maketableView];
    
    _dataArray = @[@"简单工厂",@"工厂方法模式",@"抽象工厂",@"适配器模式",@"类适配器",@"命令模式"];
    
}

- (NSArray *)dataArray
{
    if(!_dataArray)
    {
        _dataArray = [[NSArray alloc] init];
    }
    
    return _dataArray;
}


- (void)maketableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}


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
    
    switch (indexPath.row) {
        case 0:
        {
            SimpleCarFactory *simpleCarFac = [[SimpleCarFactory alloc] init];
            
            Car *car = [simpleCarFac getCarWithCarType:@"BMW"];
            
            Car *car2 = [simpleCarFac getCarWithCarType:@"TSL"];
            
            NSLog(@"car == %@,car2 == %@",car,car2);
            
        }
            break;
        case 1:
        {
            BMWFactory *bmwf = [[BMWFactory alloc] init];
            
            [bmwf getCar];
           
            TSLFactory *tslF = [[TSLFactory alloc] init];
            
            [tslF getCar];
            
        }
            break;
        case 2:
        {
            abstractBMWFactory *bmwFac = [[abstractBMWFactory alloc] init];
            Car *car = [bmwFac getCar];
            Machine *machine = [bmwFac getMachine];
        }
            break;
            
        case 3:
        {
//            对象适配器
            OriginalRequest *origin = [[OriginalRequest alloc] init];
            
            FinalRequest *final = [[FinalRequest alloc] init];
            
            final.originRequest = origin;
            
            [final newRequest];
        }
            break;
            
        case 4:
        {
//            类适配器
            Computer *computer = [[Computer alloc] init];//电脑
            Adapter *adapter = [[Adapter alloc] init];//适配器
            [computer netWithAdapter:adapter];
            
        }
            break;
            
        case 5:
        {
//            命令模式
            Barbecuer *cook = [[Barbecuer alloc] init];
            
            Command *muttonCMD = [[BakeMuttonCommand alloc] initWithReceiver:cook];
            Command *ChickenCMD = [[BakeChickenCommand alloc] initWithReceiver:cook];
            Command *muttonCMD2 = [[BakeMuttonCommand alloc] initWithReceiver:cook];
            
            Waiter *girlWait = [[Waiter alloc] init];
            
            [girlWait addOrder:muttonCMD];
            [girlWait addOrder:ChickenCMD];
            [girlWait addOrder:muttonCMD2];
            
            [girlWait cancelOrder:muttonCMD];
            
            [girlWait notify];
            
        }
            break;

        default:
            break;
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
