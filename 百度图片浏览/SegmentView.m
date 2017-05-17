//
//  SegmentView.m
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//
#define MAS_SHORTHAND

#import "SegmentView.h"
#import <Masonry/Masonry.h>

@interface SegmentView ()
@property(nonatomic, strong)UISegmentedControl *segmentControl;
@property(nonatomic, strong, readwrite)NSArray *items;
@property(nonatomic, strong)UIView *lineView;
@property(nonatomic, strong)UIView *bottomLine;
@property(nonatomic, strong)SegmentClickBlock segmentClickBlock;
@end

@implementation SegmentView

-(UISegmentedControl *)segmentControl
{
    if (!_segmentControl) {
        _segmentControl = [[UISegmentedControl alloc] initWithItems:self.items];
        // 设置默认选择项索引
        _segmentControl.selectedSegmentIndex = 0;
        
        //去掉颜色,现在整个segment都看不见
        _segmentControl.tintColor = [UIColor clearColor];
        
        NSDictionary* selectedTextAttributes = @{
            NSFontAttributeName:[UIFont systemFontOfSize:17],
            NSForegroundColorAttributeName: [UIColor orangeColor],
        };
        
        NSDictionary* unselectedTextAttributes = @{
           NSFontAttributeName:[UIFont systemFontOfSize:17],
           NSForegroundColorAttributeName: [UIColor blackColor],
        };
        [_segmentControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
        [_segmentControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
        
        [_segmentControl addTarget:self action:@selector(didClicksegmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentControl;
}

-(void)didClicksegmentedControlAction:(UISegmentedControl *)Seg{
    NSInteger index = Seg.selectedSegmentIndex;
    if (self.segmentClickBlock) {
        self.segmentClickBlock(index);
    }
    [self didClickSegmented:index];
}
-(void)didClickSegmented:(NSInteger)index
{
    self.segmentControl.selectedSegmentIndex = index;
    
    [self.lineView updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.left).offset([UIScreen mainScreen].bounds.size.width/self.items.count * index);
    }];
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
}

-(instancetype)initWithItems:(NSArray *)items segmentClick:(SegmentClickBlock)block
{
    self = [super init];
    if (self) {
        self.items = items;
        self.segmentClickBlock = block;
        [self addSubview:self.segmentControl];
        self.bottomLine = [UIView new];
        self.bottomLine.backgroundColor = [UIColor grayColor];
        [self addSubview:self.bottomLine];
        self.lineView = [UIView new];
        self.lineView.backgroundColor = [UIColor orangeColor];
        [self addSubview:self.lineView];
    }
    return self;
}
-(void)setConstraints
{
    [self.segmentControl makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(self);
    }];
    [self.bottomLine makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-1.5);
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.height.offset(0.5);
    }];
    [self.lineView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(self).multipliedBy(1.0/self.items.count);
        make.height.offset(3);
    }];

}



@end
