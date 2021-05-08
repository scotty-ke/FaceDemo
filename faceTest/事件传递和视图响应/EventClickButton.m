//
//  EventButton.m
//  faceTest
//
//  Created by 纳里健康 on 2020/8/11.
//  Copyright © 2020 songk. All rights reserved.
//  自定义一个button 只有在点击区域内最大的圆的区域，才响应点击事件 点击四个角落不响应
//  参考链接
//  https://www.jianshu.com/p/2e074db792ba

#import "EventClickButton.h"

@implementation EventClickButton

//事件传递的两个主要方法


//返回响应事件的View(即点击的View)
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if(!self.userInteractionEnabled || self.hidden == YES || self.alpha <= 0.01)
    {
//        假设button的用户交互没有打开 或者是隐藏状态 或者透明度小于0.01 就意味着当前按钮不响应点击事件
        return nil;
    }
    
//    如果响应点击事件，这个时候判断点击的位置是否在当前按钮上
    if([self pointInside:point withEvent:event])
    {
        __block UIView *hit = nil;
        
//        倒序遍历所有子视图
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
//            坐标转换 将点击的位置坐标转换为子视图的坐标
            CGPoint currentPoint = [self convertPoint:point toView:obj];
            
//           判断点击的点是否在子视图上
            hit = [obj hitTest:currentPoint withEvent:event];
            
//            如果找到了响应事件的对象，则停止遍历
            if(hit)
            {
                *stop = YES;
            }
            
        }];
        
        if(hit)
        {
            return hit;
            
        }else
        {
//            如果遍历完子视图，发现点击的点不在子视图上，则返回当前视图
            return self;
        }
    }
    
    return nil;
}

//判断点击的点是否在当前视图上

//因为只有点击圆形区域才触发点击事件，这里需要做一个判断，判断点击的位置是否在圆形区域
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    CGFloat clickX = point.x;
    
    CGFloat clickY = point.y;
    
//  获取button的中心点
    CGFloat centerX = self.frame.size.width/2;
    CGFloat centerY = self.frame.size.height/2;
    
//    获取两点之间的距离
    double dis = sqrt((clickX - centerX) *(clickX - centerX) + (clickY - centerY) * (clickY - centerY));
    
//    获取最大圆的半径
    CGFloat maxRadius = centerX > centerY ? centerY : centerX;
    
//    判断点击的点是否在正方形中间的圆上
    if(dis < maxRadius)
    {
        return YES;
    }
    
    return NO;
}

- (void)setNeedsDisplay
{
    
}
@end
