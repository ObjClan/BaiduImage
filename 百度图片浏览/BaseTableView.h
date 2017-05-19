//
//  BaseTableView.h
//  百度图片浏览
//
//  Created by jszx on 17/5/18.
//  Copyright © 2017年 Access. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewFailedDataManager.h"
#import "TableViewEmptyDataManager.h"

@interface BaseTableView : UITableView
@property(nonatomic, strong)TableViewFailedDataManager *failedManager;
@property(nonatomic, strong)TableViewEmptyDataManager *emptyManager;

@end
