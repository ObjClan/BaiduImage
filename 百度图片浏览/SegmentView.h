//
//  SegmentView.h
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^SegmentClickBlock)(NSInteger);


@interface SegmentView : UIView
@property(nonatomic, strong, readonly)NSArray *items;
-(instancetype)initWithItems:(NSArray *)items segmentClick:(SegmentClickBlock)block;
-(void)setConstraints;
-(void)didClickSegmented:(NSInteger)index;
@end
