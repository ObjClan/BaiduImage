//
//  TableViewDataManager.m
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#import "TableViewDataManager.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface TableViewDataManager ()


@end
@implementation TableViewDataManager


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const cellId = @"cellId";
    return [self getCellWithTableView:tableView identifier:cellId indexPath:indexPath];
}

-(UITableViewCell *)getCellWithTableView:(UITableView *)tableView identifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 1;
        [cell.contentView addSubview:imageView];
        
    }
    __block UIImageView *imageView = [cell.contentView viewWithTag:1];
    imageView.frame = CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width - 20, 200);
    if (self.dataArray.count > 0) {
        [imageView sd_setImageWithURL:self.dataArray[indexPath.row][@"image_url"] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            imageView.image = image;
        }];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self getCellWithTableView:tableView identifier:@"cellId" indexPath:indexPath];
    UIImageView *imageView = [cell.contentView viewWithTag:1];
    return CGRectGetMaxY(imageView.frame);
}

@end
