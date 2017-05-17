//
//  BaseViewModel.h
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject
@property(nonatomic, strong)NSMutableArray *dataArray;
-(void)getDataWithLimit:(NSInteger)limit offset:(NSInteger)offset title:(NSString *)title success:(void(^)())success failure:(void(^)())failure;
@end
