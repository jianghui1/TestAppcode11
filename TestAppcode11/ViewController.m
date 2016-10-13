//
//  ViewController.m
//  TestAppcode11
//
//  Created by ys on 16/3/30.
//  Copyright (c) 2016 suibian. All rights reserved.
//


#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wformat"
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    /*
2.汤姆现在要在家里举办宴会，他有很多根长度并不完全
     相同的筷子。现已知每根筷子的长度，每个
     客人都能拿到两根相同长度的筷子，求宴
     会最多可以招待多少名宾客的函数实现int getMax(int arrLength[N])*/
    NSMutableArray *totalArray = [@[@"2", @"3", @"2"] mutableCopy];
    NSArray *a = [self quicksortWith:0 right:totalArray.count - 1 withArray:totalArray];
    NSInteger peopleNum = [self MaxPeopleNumberWithSortArray:a];
    NSLog(@"最终人数:%@", @(peopleNum));

    /*
     * 现有一个整数序列，你可以交换其中的任意两个数以得
     * 到一个新序列，求共能得到多少种可能的结果*/
    NSArray *array = @[@(1), @(1), @(1), @(1), @(2)];
    NSInteger b = [self getTotalWithArray:array];
    NSLog(@"组合数为%ld", b);
}

- (NSArray *)quicksortWith:(NSInteger)left right:(NSInteger)right withArray:(NSMutableArray *)a
{
    NSInteger i, j, t, temp;
    if (left > right) {
        return a;
    }

    temp = [a[left] integerValue]; // temp中存的就是基数
    i = left;
    j = right;
    while (i != j) {
        // 顺序很重要,要从右边开始找
        while ([a[j] integerValue] >= temp && i < j)
            j--;
        // 在找右边的
        while ([a[i] integerValue] <= temp && i < j)
            i++;
        // 交换两个数在数组中的位置
        if (i < j) {
            t = [a[i] integerValue];
            a[i] = a[j];
            a[j] = [NSNumber numberWithInteger:t];
        }
    }
    // 最终将基数归位
    a[left] = a[i];
    a[i] = [NSNumber numberWithInteger:temp];
    [self quicksortWith:left right:i - 1 withArray:a]; // 继续处理左边的,这里是一个递归的过程
    [self quicksortWith:i + 1 right:right withArray:a]; // 继续处理右边的,这里是一个递归的过程
    return a;
}

- (NSInteger)MaxPeopleNumberWithSortArray:(NSArray *)a
{
    NSInteger temp = 0;
    NSInteger peopleNum = 0;
    for (int i = 0; i < a.count - 1; i++) {
        if (a[i] != a[i + 1]) {
            peopleNum += (i + 1 - temp) / 2;
            temp = i + 1;
        }
    }
    return peopleNum;
}

- (NSInteger)getTotalWithArray:(NSArray *)array
{
    NSInteger k = 0;
    for (int l = 0; l < array.count - 1; ++l) {
        for (int m = l + 1; m < array.count; ++m) {
            NSLog(@"%ld---%ld", [array[l] integerValue], [array[m] integerValue]);
            if ([array[l] integerValue] != [array[m] integerValue]) {
                k++;
            }
        }
    }
    return k;
}

@end