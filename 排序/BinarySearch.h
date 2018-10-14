//
//  BinarySearch.h
//  排序
//
//  Created by  xuzhenzhen on 2018/10/14.
//  Copyright © 2018年  xuzhenzhen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinarySearch : NSObject

/// 递归
+ (NSInteger)binarySearchWithRecursion:(NSArray *)srcArray withDes:(NSNumber *)des;

/// 非递归
+ (NSInteger)binarySearchNoRecursion:(NSArray *)srcArray withDes:(NSNumber *)des;
@end
