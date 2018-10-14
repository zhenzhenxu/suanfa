//
//  ViewController.m
//  排序
//
//  Created by  xuzhenzhen on 2018/10/10.
//  Copyright © 2018年  xuzhenzhen. All rights reserved.
//

#import "ViewController.h"
#import "BinarySearch.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *dataArr = [NSMutableArray arrayWithObjects:@3,@6,@4,@1,@7,@3,@9,@5, nil];
   
    
//    NSMutableArray *bubbleArray = [self bubbleSortArray:dataArr];
//    NSLog(@"冒泡排序 %@ \n",bubbleArray);
//
//    NSMutableArray *insertArray = [self insertSortArray:dataArr];
//    NSLog(@"插入排序 %@ \n",insertArray);
//
    
//   NSMutableArray *selectArray = [self selectSortArray:dataArr];
//    NSLog(@"选择排序 %@ \n",selectArray);
//
    
//    [self quickSortWithArray:dataArr withLeft:0 andRight:dataArr.count -1];
//    NSLog(@"快速排序 %@ \n",dataArr);
    
    NSArray *ary = @[@1,@10,@5,@11];
    
    NSLog(@"非递归二分查找%ld",[BinarySearch binarySearchNoRecursion:ary withDes:@10]);
    
    NSLog(@"递归二分查找%ld",[BinarySearch binarySearchWithRecursion:ary withDes:@11]);
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -  冒泡排序



- (NSMutableArray *)bubbleSortArray:(NSMutableArray *)arr
{
    id temp;
    int i, j;
    for (i=0; i < [arr count] - 1; ++i) {
        for (j=0; j < [arr count] - i - 1; ++j) {
            if (arr[j] > arr[j+1]) { // 升序排列
                temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
        }
    }
    return arr;
}

#pragma mark -  插入排序
- (NSMutableArray *)insertSortArray:(NSMutableArray *)dataArr
{
    
    for (int i = 0; i < dataArr.count; i++) {
        for (int j = i; j > 0; j--) {
            if ([dataArr[j] intValue] < [dataArr[j - 1] intValue]) {
                [dataArr exchangeObjectAtIndex:j withObjectAtIndex:j-1];
            }
        }
    }
    return dataArr;
    
}

#pragma mark - 选择排序
/**
 
 1. 设数组内存放了n个待排数字，数组下标从1开始，到n结束。
 2. i=1
 3. 从数组的第i个元素开始到第n个元素，寻找最小的元素。（具体过程为:先设arr[i]为最小，逐一比较，若遇到比之小的则交换）
 4. 将上一步找到的最小元素和第i位元素交换。
 5. 如果i=n－1算法结束，否则回到第3步
 平均时间复杂度：O(n^2)
 平均空间复杂度：O(1)
 
 */
- (NSMutableArray *)selectSortArray:(NSArray *)array
{
    
    id temp;
    int min, i, j;
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    
    for (i=0; i < [arr count]; ++i) {
        min = i;
        for (j = i+1; j < [arr count]; ++j) {
            
            if (arr[min] > arr[j]) {
                min = j;
            }
            
        }
        
        if (min != i) {
            temp = arr[min];
            arr[min] = arr[i];
            arr[i] = temp;
        }
    }
    
    return arr;
}

#pragma mark - 快速排序
- (void)quickSortWithArray:(NSMutableArray *)array withLeft:(NSInteger)left andRight:(NSInteger)right{
    if (left >= right) return;
    
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = [array[left] integerValue];
    
    while (i < j) {
        while (i < j && key <= [array[j] integerValue]) {
            j--;
        }
        array[i] = array[j];
        while (i < j && key >= [array[i] integerValue]) {
            i++;
        }
        array[j] = array[i];
    }
    array[i] = [NSNumber numberWithInteger:key];
    
    [self quickSortWithArray:array withLeft:left andRight:i - 1];
    [self quickSortWithArray:array withLeft:i + 1 andRight:right];
}

   



@end
