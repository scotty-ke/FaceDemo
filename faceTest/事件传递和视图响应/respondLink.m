//
//  respondLink.m
//  faceTest
//
//  Created by 宋柯 on 2021/1/22.
//  Copyright © 2021 songk. All rights reserved.
//  视图响应链

#import "respondLink.h"

@implementation respondLink

/*
    视图响应 当点击事件发生的时候，先看当前视图是否处理响应时间，如果不处理，就查找当前视图的父视图，没有父视图的时候，就传递到UIWindows，再不响应，就传递给UIApplication -> UIAPPlicationDelegate 如果一直到最后没有处理，则不处理当前事件
 */

@end
 
