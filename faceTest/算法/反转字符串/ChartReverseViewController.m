//
//  ChartReverseViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/9/14.
//  Copyright © 2020 songk. All rights reserved.
//

#import "ChartReverseViewController.h"

@interface ChartReverseViewController ()

@end

@implementation ChartReverseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)chartReverse
{
//    以string为标准，这个字符传不做修改，只用来取相应位置的字符
    NSString *string = @"hello,word";
    
    NSMutableString *reverseString = [NSMutableString stringWithString:string];
    
    for (NSInteger i = 0; i < (string.length + 1)/2; i ++) {
        
        [reverseString replaceCharactersInRange:NSMakeRange(i, 1) withString:[string substringWithRange:NSMakeRange(string.length - i - 1, 1)]];
        
        [reverseString replaceCharactersInRange:NSMakeRange(string.length - i - 1, 1) withString:[string substringWithRange:NSMakeRange(i, 1)]];
        
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
