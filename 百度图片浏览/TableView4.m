//
//  TableView1.m
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#import "TableView4.h"
#import "TableViewDataManager.h"
#import "BaseViewModel.h"
#import <MJRefresh/MJRefresh.h>

@interface TableView4 ()
@property(nonatomic, strong)TableViewDataManager *manager;
@property(nonatomic, strong)BaseViewModel *model;
@end
@implementation TableView4

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.manager = [TableViewDataManager new];
        self.model = [BaseViewModel new];
        
        __weak typeof(self)weakSelf = self;
        
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            __strong typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf.manager.dataArray removeAllObjects];
            __weak typeof(strongSelf)weaSelf1 = strongSelf;
            [strongSelf.model getDataWithLimit:10 offset:0 title:@"内涵" success:^{
                __strong typeof(weaSelf1)strongSelf1 = weaSelf1;
                [strongSelf1.mj_header endRefreshing];
                if (strongSelf1.model.dataArray.count > 0) {
                    strongSelf1.delegate = strongSelf1.manager;
                    strongSelf1.dataSource = strongSelf1.manager;
                } else {
                    strongSelf1.delegate = strongSelf1.emptyManager;
                    strongSelf1.dataSource = strongSelf1.emptyManager;
                }
                strongSelf1.manager.dataArray = strongSelf1.model.dataArray;
                [strongSelf1 reloadData];
            } failure:^{
                __strong typeof(weaSelf1)strongSelf1 = weaSelf1;
                strongSelf1.delegate = self.failedManager;
                strongSelf1.dataSource = self.failedManager;
                [strongSelf1.mj_header endRefreshing];
                [strongSelf1 reloadData];
            }];
        }];
        
        self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            __strong typeof(weakSelf)strongSelf = weakSelf;
            __weak typeof(strongSelf)weaSelf1 = strongSelf;
            [strongSelf.model getDataWithLimit:10 offset:strongSelf.manager.dataArray.count + 10 title:@"内涵" success:^{
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
        
        [self.model getDataWithLimit:10 offset:0 title:@"内涵" success:^{
            __strong typeof(weakSelf)strongSelf = weakSelf;
            if (strongSelf.model.dataArray.count > 0) {
                strongSelf.delegate = strongSelf.manager;
                strongSelf.dataSource = strongSelf.manager;
            } else {
                strongSelf.delegate = strongSelf.emptyManager;
                strongSelf.dataSource = strongSelf.emptyManager;
            }
            strongSelf.manager.dataArray =strongSelf.model.dataArray;
            [strongSelf reloadData];
        } failure:^{
            __strong typeof(weakSelf)strongSelf = weakSelf;
            strongSelf.delegate = self.failedManager;
            strongSelf.dataSource = self.failedManager;
            [strongSelf reloadData];
        }];
        
    }
    return self;
}

@end
