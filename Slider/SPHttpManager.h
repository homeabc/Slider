//
//  SPHttpManager.h
//  EarthInfomation
//
//  Created by 洪福清 on 2017/3/22.
//  Copyright © 2017年 BJTYL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"


@interface AFHttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

typedef void (^HttpSuccessBlock) (id responseObject);
typedef void (^HttpFailureBlock) (NSError *error);

@interface SPHttpManager : NSObject

/**
 *  AFN get请求
 *
 *  @param path URL地址
 *
 *  @param params 请求参数 (NSDictionary)
 *
 *  @param success 请求成功返回值（NSArray or NSDictionary）
 *
 *  @param failure 请求失败值 (NSError)
 */
+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure;


+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure;

+ (void)postWithPaths:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure;



@end
