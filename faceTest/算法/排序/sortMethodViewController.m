//
//  sortMethodViewController.m
//  faceTest
//
//  Created by 纳里健康 on 2020/9/11.
//  Copyright © 2020 songk. All rights reserved.
//  排序方法

#import "sortMethodViewController.h"

@interface sortMethodViewController ()

@end

@implementation sortMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *array = @[[NSNumber numberWithInt:5],
                             [NSNumber numberWithInt:3],
                             [NSNumber numberWithInt:7],
                             [NSNumber numberWithInt:6],
                             [NSNumber numberWithInt:4],
                             [NSNumber numberWithInt:1],
                             [NSNumber numberWithInt:0],
                             [NSNumber numberWithInt:2],
                             [NSNumber numberWithInt:9],
                             [NSNumber numberWithInt:10],
                             [NSNumber numberWithInt:8]].mutableCopy;
    
    int result = [self findMedianWithArray:array];
    
    NSLog(@"中位数是=== %d",result);
    
    NSLog(@"排序结果是%@",[self bublleSort:array]);
}

#pragma mark - 冒泡
- (void)sortArray:(NSMutableArray *)array
{
    for (int i = 0; i < array.count; i++) {
        for (int j = 0; i < array.count - 1 - i; j++) {
            
        }
    }
}




/*
  【选择排序】:最值出现在起始端
  第1趟:在n个数中找到最小(大)数与第一个数交换位置
  第2趟:在剩下n-1个数中找到最小(大)数与第二个数交换位置  重复这样的操作...依次与第三个、第四个...数交换位置
  第n-1趟，最终可实现数据的升序(降序)排列。
 */
- (NSMutableArray *)selectSortMethod:(NSMutableArray *)array
{
    NSInteger length = array.count;
    
    for (int i = 0; i < length - 1; i++) {
        for (int j = i + 1; j < length; j++) {
            
            NSLog(@"length == %ld, j == %d",(long)length,j);
//            取出第i个元素 和剩下的每个元素比较，把最小的值赋给array[i]
            NSInteger arrayi = [array[i] intValue];
            
            NSInteger arrayj = [array[j] intValue];
            
            if(arrayi > arrayj)
            {
//                把小的值方法前面
                [array replaceObjectAtIndex:i withObject:[NSNumber numberWithInteger:arrayj]];
                [array replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:arrayi]];
            }
        }
    }
    
    return array;
}


- (void)selectSortWithArray:(NSMutableArray *)array
{
    NSInteger count = array.count;
    
    for (int i = 0; i < count - 1; i++) {
        
        for (int j = i + 1; j < count; j++) {
            
            int numI = [array[i] intValue];
            
            int numJ = [array[j] intValue];
            
            if(numI > numJ)
            {
                [array replaceObjectAtIndex:i withObject:@(numJ)];
                
                [array replaceObjectAtIndex:j withObject:@(numI)];
            }
        }
    }
}

/*
 冒泡排序
  【冒泡排序】:相邻元素两两比较，比较完一趟，最值出现在末尾
  第1趟:依次比较相邻的两个数，不断交换(小数放前，大数放后)逐个推进，最值最后出现在第n
 个元素位置
  第2趟:依次比较相邻的两个数，不断交换(小数放前，大数放后)逐个推进，最值最后出现在第
 n-1 个元素位置
  ............
  第n-1趟:依次比较相邻的两个数，不断交换(小数放前，大数放后)逐个推进，最值最后出现在第 2 个元素位置
 */
- (NSMutableArray *)bublleSort:(NSMutableArray *)array
{
    NSInteger length = array.count;
    
    for (int i = 0; i < length; i ++) {
        for (int j = 0; j < length - i - 1; j++) {
            
            NSInteger number = [array[j] intValue];
            
            NSInteger nextNum = [array[j + 1] intValue];
//每比较一次，将相邻两个数中的小数往后挪
            if(number < nextNum)
            {
                [array replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:nextNum]];
                
                [array replaceObjectAtIndex:j+1 withObject:[NSNumber numberWithInteger:number]];
            }
            
        }
    }
    
    return array;
}


- (NSMutableArray *)bullSortArray:(NSMutableArray *)array
{
    NSInteger length = array.count;
    
    for (int i = 0; i < length; i++) {
        for (int j = 0; j < length - i; j++) {
            
            NSInteger number = [array[j] intValue];
            
            NSInteger nextNum = [array[j + 1] intValue];
//每比较一次，将相邻两个数中的小数往后挪
            if(number < nextNum)
            {
                [array replaceObjectAtIndex:j withObject:[NSNumber numberWithInteger:nextNum]];
                
                [array replaceObjectAtIndex:j+1 withObject:[NSNumber numberWithInteger:number]];
            }

            
        }
    }
    
    return array;
}

/*
 快排
 
 排序演示
 假设一开始序列{xi}是：5，3，7，6，4，1，0，2，9，10，8。
 此时，ref=5，i=1，j=11，从后往前找，第一个比5小的数是x8=2，因此序列为：2，3，7，6，4，1，0，5，9，10，8。
 此时i=1，j=8，从前往后找，第一个比5大的数是x3=7，因此序列为：2，3，5，6，4，1，0，7，9，10，8。
 此时，i=3，j=8，从第8位往前找，第一个比5小的数是x7=0，因此：2，3，0，6，4，1，5，7，9，10，8。
 此时，i=3，j=7，从第3位往后找，第一个比5大的数是x4=6，因此：2，3，0，5，4，1，6，7，9，10，8。
 此时，i=4，j=7，从第7位往前找，第一个比5小的数是x6=1，因此：2，3，0，1，4，5，6，7，9，10，8。
 此时，i=4，j=6，从第4位往后找，直到第6位才有比5大的数，这时，i=j=6，ref成为一条分界线，它之前的数都比它小，之后的数都比它大，对于前后两部分数，可以采用同样的方法来排序。
 */

- (void)quickSort:(NSMutableArray *)m low:(int)low high:(int)high
{
//    递归结束条件
   if(low >= high)
   {
       return;
   }
//    获取数组的第一个下标以及最后一位的下标，两个开始遍历的标记位
    int i= low;
    int j = high;
    
//    一般将key值设置为数组的第一个元素
    id key = m[i];
    
    while (i<j) {
        
        while (i<j && [m[j] intValue] >= [key intValue]) {
//            从后往前找，找第一个比key值小的数字
            j--;
        }
        
        if(i == j)
        {
//            当key值就是最小值的时候，会出现i==j
            break;
        }
        
        m[i++] = m[j];
        
        //            从前往后找，找第一个比key大的值
        while (i<j && [m[i] intValue] <= [key intValue]) {
            i++;
        }
        
        if(i==j)
        {
            break;
        }
        
//       将找到的第一个大于key的值赋值到刚才找到第一个比key小的值的位置
        m[j--] = m[i];
    }
    
    m[i] = key;
    
    [self quickSort: m low: low high: i-1];
    [self quickSort: m low: i+1 high: high];
}



- (int)findMedianWithArray:(NSMutableArray *)array
{
    int aLeng = (int)array.count;
    
    int low = 0;
    int height = aLeng - 1;
    
    int mid = (aLeng - 1)/2;
    
    int div = [self partSoreArray:array start:low end:height];
    
    NSLog(@"支点位置是 === %d 支点的值是 %@",div,array[div]);
    
    while (div != mid) {
        if(mid < div)
        {
            NSLog(@"左边查找");
            div = [self partSoreArray:array start:low end:div - 1];
        }else
        {
            NSLog(@"右边边查找");
            div = [self partSoreArray:array start:div + 1 end:height];
        }
    }
     
    return [array[mid] intValue];
}


/*
 快排
 
 排序演示
 假设一开始序列{xi}是：5，3，7，6，4，1，0，2，9，10，8。
 此时，ref=5，i=1，j=11，从后往前找，第一个比5小的数是x8=2，因此序列为：2，3，7，6，4，1，0，5，9，10，8。
 此时i=1，j=8，从前往后找，第一个比5大的数是x3=7，因此序列为：2，3，5，6，4，1，0，7，9，10，8。
 此时，i=3，j=8，从第8位往前找，第一个比5小的数是x7=0，因此：2，3，0，6，4，1，5，7，9，10，8。
 此时，i=3，j=7，从第3位往后找，第一个比5大的数是x4=6，因此：2，3，0，5，4，1，6，7，9，10，8。
 此时，i=4，j=7，从第7位往前找，第一个比5小的数是x6=1，因此：2，3，0，1，4，5，6，7，9，10，8。
 此时，i=4，j=6，从第4位往后找，直到第6位才有比5大的数，这时，i=j=6，ref成为一条分界线，它之前的数都比它小，之后的数都比它大，对于前后两部分数，可以采用同样的方法来排序。
 */
- (int)partSoreArray:(NSMutableArray *)array start:(int)start end:(int)end
{
    int low = start;
    int height = end;
    
//    选取比较关键字
    int key = [array[end] intValue];
    
    NSLog(@"key is %d",key);
    
    while (low < height) {
        
//        在左边查找第一个比key大的值
        while (low < height && [array[low] intValue] <= key) {
            
            ++low;
            NSLog(@"查找到比key大的数是%@",array[low]);
        }
        
//        在右边查找第一个比key小的值
        while (low < height && [array[height] intValue] >= key) {
            
            --height;
            
            NSLog(@"查找到比key小的数是%@",array[height]);
            
        }
        
        if(low < height)
        {
            int lowValue = [array[low] intValue];
            int heightValue = [array[height] intValue];
            
            [array replaceObjectAtIndex:low withObject:[NSNumber numberWithInt:heightValue]];
            [array replaceObjectAtIndex:height withObject:[NSNumber numberWithInt:lowValue]];
            
            NSLog(@"操作一次以后的数组 %@",array);
        }
        
    }
    
    int heightValue = [array[height] intValue];
    int endValue = [array[end] intValue];
    
    [array replaceObjectAtIndex:end withObject:[NSNumber numberWithInt:heightValue]];
    [array replaceObjectAtIndex:height withObject:[NSNumber numberWithInt:endValue]];

    
    return low;
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
