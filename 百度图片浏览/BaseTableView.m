//
//  BaseTableView.m
//  百度图片浏览
//
//  Created by jszx on 17/5/18.
//  Copyright © 2017年 Access. All rights reserved.
//

#import "BaseTableView.h"
#import "TableViewStartDataManager.h"


@interface BaseTableView ()
@property(nonatomic, strong)TableViewStartDataManager *startManager;
@end
@implementation BaseTableView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.startManager = [TableViewStartDataManager new];
        self.failedManager = [TableViewFailedDataManager new];
        self.emptyManager = [TableViewEmptyDataManager new];
        self.delegate = self.startManager;
        self.dataSource = self.startManager;
    }
    return self;
}

@end
