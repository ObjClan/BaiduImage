//
//  HTTPManager.m
//  百度图片浏览
//
//  Created by jszx on 17/5/18.
//  Copyright © 2017年 Access. All rights reserved.
//

#define BASEURL @"http://image.baidu.com"

#import "HTTPManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation HTTPManager

-(void)httpRequestWithMethod:(NSString *)method
                      subUrl:(NSString *)subUrl parameters:(id)parameters
                    progress:(void (^)(NSProgress * _Nonnull))downloadProgress
                     success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASEURL]];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    
    
    [manager GET:@"" parameters:nil progress:nil success:success failure:failure];
    
}

@end
