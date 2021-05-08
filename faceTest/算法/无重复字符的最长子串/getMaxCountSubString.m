//
//  getMaxCountSubString.m
//  faceTest
//
//  Created by 宋柯 on 2021/4/15.
//  Copyright © 2021 songk. All rights reserved.
//

#import "getMaxCountSubString.h"

@implementation getMaxCountSubString

- (void)runMethod
{
    NSLog(@"abcabcbb 最大无重复字符的子串长度是%ld",(long)[self getMaxSubStringCountWithString:@"abcabcbb"]);
    
    NSLog(@"bbbbb 最大无重复字符的子串长度是%ld",(long)[self getMaxSubStringCountWithString:@"bbbbb"]);

    
    NSLog(@"pwwkew 最大无重复字符的子串长度是%ld",(long)[self getMaxSubStringCountWithString:@"pwwkew"]);
}


/*
    创建一个数组，存放子串的字符
    遍历字符串中的字符
    如果字符在子串数组中已经存在，查找字符在数组中的位置，把这个字符之前的字符全部删除
    
    把字符添加到子串数组中，最大数为上次的最大数和子串数组的count个数
    
    
 */
- (NSInteger)getMaxSubStringCountWithString:(NSString *)string
{
    if([string isEqualToString:@""])
    {
        return 0;
    }
    
    NSInteger maxCount = 0;
    
    NSMutableArray *charArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < string.length; i++) {
    
        NSString *charString = [NSString stringWithFormat:@"%hu",[string characterAtIndex:i]];
        
        if([charArray containsObject:charString])
        {
//            获取字符串在数组中的位置
            NSInteger oldCharIndex = [charArray indexOfObject:charString];
//            删除数组中当前下标之前的所有字符
            [charArray removeObjectsInRange:NSMakeRange(0, oldCharIndex + 1)];
        }
        
        [charArray addObject:charString];
        
        if(charArray.count > maxCount)
        {
            maxCount = charArray.count;
        }
    }
    
    return maxCount;
}

@end
