//
//  TableViewFailedDataManager.m
//  百度图片浏览
//
//  Created by jszx on 17/5/18.
//  Copyright © 2017年 Access. All rights reserved.
//

#import "TableViewEmptyDataManager.h"

@implementation TableViewEmptyDataManager
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    UIImage *errorImage = [UIImage imageNamed:@"empty.png"];
    UIImageView *errorImageView = [UIImageView new];
    errorImageView.image = errorImage;
    errorImageView.bounds = CGRectMake(0, 0, errorImage.size.width, errorImage.size.height);
    errorImageView.center = CGPointMake(tableView.superview.center.x, tableView.center.y - 50);
    [cell.contentView addSubview:errorImageView];
    
    UILabel *notifyLab = [UILabel new];
    notifyLab.text = @"暂无相关内容，敬请期待!";
    notifyLab.textAlignment = NSTextAlignmentCenter;
    notifyLab.font = [UIFont systemFontOfSize:20];
    notifyLab.textColor = [UIColor grayColor];
    notifyLab.frame = CGRectMake(0, CGRectGetMaxY(errorImageView.frame), CGRectGetWidth(tableView.frame), 40);
    [cell.contentView addSubview:notifyLab];
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetHeight(tableView.frame);
}
@end
