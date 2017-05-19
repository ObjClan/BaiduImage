//
//  BaseViewModel.m
//  百度图片浏览
//
//  Created by jszx on 17/5/16.
//  Copyright © 2017年 Access. All rights reserved.
//


#import "BaseViewModel.h"
#import <AFNetworking/AFNetworking.h>

@implementation BaseViewModel

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)getDataWithLimit:(NSInteger)limit offset:(NSInteger)offset title:(NSString *)title success:(void(^)())success failure:(void(^)())failure
{
    
    NSString *urlStr = [NSString stringWithFormat:@"http://image.baidu.com/channel/listjson?pn=%ld&rn=%ld&tag1=%@&tag2=全部&ie=utf8",offset,limit,title];
#ifdef __IPHONE_9_0
    urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
#else
    urlStr = [urlStr  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
#endif
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:urlStr]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    
    [manager GET:@"" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
   
        NSArray *array = responseObject[@"data"];
        for (NSDictionary *dict in array) {
            if ([dict valueForKey:@"image_url"]) {
                [self.dataArray addObject:dict];
            }
        }
        
        if (success) {
            success();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure();
        }
    }];
    
}
-(void)dealloc
{
    NSLog(@"BaseViewMode dealloc");
}
@end
