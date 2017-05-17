//
//  MainScrollView.m
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#define MAS_SHORTHAND

#import "MainScrollView.h"
#import "TableView1.h"
#import "TableView2.h"
#import "TableView3.h"
#import "TableView4.h"


@implementation MainScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        TableView1 *tableView1 = [TableView1 new];
        tableView1.tag = 1001;
        [self addSubview:tableView1];
    }
    return self;
}


-(void)setSubViewFrame
{
    [self layoutIfNeeded];
    UIView *view = [self viewWithTag:1001];
    view.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat i = scrollView.contentOffset.x / [UIScreen mainScreen].bounds.size.width;
    
    if (i > 0 && i <= 1) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[TableView2 class]]) {
                return;
            }
        }
        TableView2 *tableView2 = [TableView2 new];
        [self layoutIfNeeded];
        tableView2.frame = CGRectMake(CGRectGetWidth(self.frame), 0,  CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        [self addSubview:tableView2];
        
    } else if (i > 1 && i <= 2) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[TableView3 class]]) {
                return;
            }
        }
        TableView3 *tableView3 = [TableView3 new];
        [self layoutIfNeeded];
        tableView3.frame = CGRectMake(CGRectGetWidth(self.frame) * 2, 0,  CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        [self addSubview:tableView3];
        
    } else if (i > 2 && i <= 3) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[TableView4 class]]) {
                return;
            }
        }
        TableView4 *tableView4 = [TableView4 new];
        [self layoutIfNeeded];
        tableView4.frame = CGRectMake(CGRectGetWidth(self.frame) * 3, 0,  CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        [self addSubview:tableView4];
        
    }
}

@end
