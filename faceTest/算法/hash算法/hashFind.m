//
//  hashFind.m
//  faceTest
//
//  Created by 宋柯 on 2021/3/25.
//  Copyright © 2021 songk. All rights reserved.
//  哈希查找
//  用字典存储每个字符出现的次数
//  遍历字符串，在字典中查找每个字符串出现的次数，如果次数为1直接跳出遍历

#import "hashFind.h"

@interface hashFind ()

@end

@implementation hashFind

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self findFirshCharWithString:@"abaccdeff"];
}

- (void)findFirshCharWithString:(NSString *)orangeString
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    for (int i = 0; i < orangeString.length; i++) {
        
        NSString *charactor = [NSString stringWithFormat:@"%c",[orangeString characterAtIndex:i]];
        
        if([dict objectForKey:charactor])
        {
            int num = [dict[charactor] intValue];
            
            num++;
            
            [dict setValue:[NSNumber numberWithInt:num] forKey:charactor];
        }else
        {
            [dict setValue:[NSNumber numberWithInt:1] forKey:charactor];
        }
        
    }
    
//    遍历原字符串，查找字典中存储的字符次数
    for (int i = 0; i < orangeString.length; i++) {
        
        NSString *string = [NSString stringWithFormat:@"%c",[orangeString characterAtIndex:i]];
        
        int num = [dict[string] intValue];
        
        if(num == 1)
        {
            NSLog(@"第一个出现一次的字符串是%@",string);
            
            break;
            
        }
    }
}

- (void)findStringWithCharacter:(NSString *)string
{
    NSMutableDictionary *dice = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i < string.length; i++) {
        
        NSString *character = [NSString stringWithFormat:@"%c",[string characterAtIndex:i]];
        
        if([dice objectForKey:character])
        {
            int num = [[dice objectForKey:character] intValue];
            
            num += 1;
            
            [dice setValue:[NSNumber numberWithInt:num] forKey:character];
        }else
        {
            [dice setValue:[NSNumber numberWithInt:1] forKey:character];
        }
        
    }
    
    for (int i = 0; i < string.length; i++) {
        
        NSString *character = [NSString stringWithFormat:@"%c",[string characterAtIndex:i]];

        int count = [[dice objectForKey:character] intValue];
        
        if(count == 1)
        {
            NSLog(@"第一个出现的数字是 %@",character);
        }
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
