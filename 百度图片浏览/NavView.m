//
//  NavView.m
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#define MAS_SHORTHAND
typedef void (^NavBackBlock)();

#import "NavView.h"
#import <Masonry/Masonry.h>

@interface NavView()
@property(nonatomic, strong)NavBackBlock navBack;

@end
@implementation NavView

- (instancetype)initWithBack:(void(^)())backBlock
{
    self = [super init];
    if (self) {
        self.navBack = backBlock;
        self.backgroundColor = [UIColor orangeColor];
        UIButton *backBtn = [UIButton new];
        backBtn.tag = 100;
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];
        backBtn.hidden = YES;
        
        UILabel *titleLab = [UILabel new];
        titleLab.tag = 101;
        titleLab.text = @"百度图片浏览";
        titleLab.textColor = [UIColor whiteColor];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.font = [UIFont systemFontOfSize:20];
        [self addSubview:titleLab];
    }
    return self;
}

-(void)setConstraints
{
    UIButton *backBtn = [self viewWithTag:100];
    [backBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.left.equalTo(self);
        make.bottom.equalTo(self);
        make.width.offset(60);
    }];
    
    UILabel *titleLab = [self viewWithTag:101];
    CGRect rect = [titleLab.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : titleLab.font} context:nil];
    [titleLab makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(20);
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
        make.width.offset(rect.size.width);
    }];
}
-(void)back
{
    if (self.navBack) {
        self.navBack();
    }
}

@end
