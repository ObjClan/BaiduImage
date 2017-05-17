//
//  TableViewDataManager.h
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewDataManager : NSObject<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)NSMutableArray *dataArray;

@end
