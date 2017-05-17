//
//  ContentViewController.m
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//
#define MAS_SHORTHAND

#import "ContentViewController.h"
#import "MainScrollView.h"
#import "NavView.h"
#import <Masonry/Masonry.h>
#import "SegmentView.h"
#import "MainScrollView.h"
#import <BLKFlexibleHeightBar/BLKDelegateSplitter.h>

@interface ContentViewController ()<UIScrollViewDelegate>
@property(nonatomic, strong)NavView *navView;
@property(nonatomic, strong)SegmentView *segmentView;
@property(nonatomic, strong)MainScrollView *scrollView;
@property(nonatomic, strong)BLKDelegateSplitter *delegateSplitter;
@end

@implementation ContentViewController

-(NavView *)navView
{
    if (!_navView) {
        __weak typeof(self)weakSelf = self;
        _navView = [[NavView alloc] initWithBack:^{
            __strong typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _navView;
}
-(SegmentView *)segmentView
{
    if (!_segmentView) {
        __weak typeof(self)weakSelf = self;
        _segmentView = [[SegmentView alloc] initWithItems:@[@"美女",@"植物",@"明星",@"宠物"] segmentClick:^(NSInteger index) {
            __strong typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf.scrollView setContentOffset:CGPointMake([UIScreen mainScreen].bounds.size.width * index, 0)];
        }];
        
    }
    return _segmentView;
}
-(MainScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [MainScrollView new];
        _scrollView.contentSize = CGSizeMake(self.segmentView.items.count * [UIScreen mainScreen].bounds.size.width, 0);
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.navView];
    [self.view addSubview:self.segmentView];
    [self.view addSubview:self.scrollView];
    
    [self setConstraints];
    
    self.delegateSplitter = [[BLKDelegateSplitter alloc] initWithFirstDelegate:self.scrollView secondDelegate:self];
    self.scrollView.delegate = (id<UIScrollViewDelegate>)self.delegateSplitter;
}

-(void)setConstraints
{
    [self.navView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.offset(64);
    }];
    
    [self.navView setConstraints];
    
    [self.segmentView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.navView.bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.offset(50);
    }];
    
    [self.segmentView setConstraints];
    
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentView.bottom);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    [self.scrollView setSubViewFrame];

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self.segmentView didClickSegmented:scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width];
}
-(void)dealloc
{
    NSLog(@"11111");
}
@end
