//
//  TableViewInitDataManager.m
//  百度图片浏览
//
//  Created by jszx on 17/5/18.
//  Copyright © 2017年 Access. All rights reserved.
//

#import "TableViewStartDataManager.h"
#import <SDWebImage/UIImage+GIF.h>

@implementation TableViewStartDataManager
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell new];
    UIImage *errorImage = [UIImage sd_animatedGIFNamed:@"loading"];
    UIImageView *errorImageView = [UIImageView new];
    errorImageView.image = errorImage;
    errorImageView.bounds = CGRectMake(0, 0, errorImage.size.width, errorImage.size.height);
    errorImageView.center = CGPointMake(tableView.superview.center.x, tableView.center.y - 50);
    [cell.contentView addSubview:errorImageView];
    
    UILabel *notifyLab = [UILabel new];
    notifyLab.text = @"数据加载中,请稍等...";
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
