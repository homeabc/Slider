//
//  SPHttpManager.m
//  EarthInfomation
//
//  Created by 洪福清 on 2017/3/22.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import "SPHttpManager.h"
#import "AFNetworking.h"

// 服务器地址
static NSString *const kBaseURLString = @"http://t.navline.com";


@implementation AFHttpClient

+ (instancetype)sharedClient {
    static AFHttpClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
        _sharedClient.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedClient.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"application/x-javascript",@"text/plain",@"image/gif", nil];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}


@end


@implementation SPHttpManager

#pragma mark - AFN网络请求
#pragma mark POST请求
+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure {
    AFHttpClient *manager = [AFHttpClient sharedClient];
    
    NSString *utf8 = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    [manager POST:utf8 parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success == nil) return;
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure == nil) return;
        failure(error);
    }];
    
}

#pragma mark GET请求

+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure {
    AFHttpClient *manager = [AFHttpClient sharedClient];
    
    
    [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success == nil) return;
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure == nil) return;
        failure(error);
    }];
    
}

+ (void)postWithPaths:(NSString *)path
               params:(NSDictionary *)params
              success:(HttpSuccessBlock)success
              failure:(HttpFailureBlock)failure
{
    AFHttpClient *manager = [AFHttpClient sharedClient];
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success == nil) return;
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure == nil) return;
        failure(error);
    }];
}




@end
