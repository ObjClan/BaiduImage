//
//  NavView.h
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavView : UIView
- (instancetype)initWithBack:(void(^)())backBlock;
-(void)setConstraints;
@end
