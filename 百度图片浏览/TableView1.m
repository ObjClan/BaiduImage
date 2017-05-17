//
//  TableView1.m
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#import "TableView1.h"
#import "TableViewDataManager.h"
#import "BaseViewModel.h"
#import <MJRefresh/MJRefresh.h>

@interface TableView1 ()
@property(nonatomic, strong)TableViewDataManager *manager;
@property(nonatomic, strong)BaseViewModel *model;
@end
@implementation TableView1

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.manager = [TableViewDataManager new];
        self.delegate = self.manager;
        self.dataSource = self.manager;
        
        self.model = [BaseViewModel new];
        
        __weak typeof(self)weakSelf = self;
        
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            __strong typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf.manager.dataArray removeAllObjects];
            __weak typeof(strongSelf)weaSelf1 = strongSelf;
            [strongSelf.model getDataWithLimit:10 offset:0 title:@"美女" success:^{
                __strong typeof(weaSelf1)strongSelf1 = weaSelf1;
                [strongSelf1.mj_header endRefreshing];
                strongSelf1.manager.dataArray =strongSelf1. model.dataArray;
                [strongSelf1 reloadData];
            } failure:^{
                __strong typeof(weaSelf1)strongSelf1 = weaSelf1;
                [strongSelf1.mj_header endRefreshing];
                [strongSelf1 reloadData];
            }];
        }];
        
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            __strong typeof(weakSelf)strongSelf = weakSelf;
            __weak typeof(strongSelf)weaSelf1 = strongSelf;
            [strongSelf.model getDataWithLimit:10 offset:strongSelf.manager.dataArray.count + 10 title:@"美女" success:^{
                __strong typeof(weaSelf1)strongSelf1 = weaSelf1;
                [strongSelf1.mj_footer endRefreshing];
                strongSelf1.manager.dataArray = strongSelf1.model.dataArray;
                [strongSelf1 reloadData];
            } failure:^{
                __strong typeof(weaSelf1)strongSelf1 = weaSelf1;
                [strongSelf1.mj_footer endRefreshing];
                [strongSelf1 reloadData];
            }];
        }];
        
        [self.mj_header beginRefreshing];
        
    }
    return self;
}

@end
