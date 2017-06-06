//
//  HttpRequstData.h
//  ProjectFrame
//
//  Created by 黄雄彪 on 16/1/15.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetStatusData.h"

@interface HttpRequstData : NSObject

+ (void)getUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)getNoHUDUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postUrl:(NSString*)url parameters:(NSDictionary*)parameters showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postNoHUDUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+ (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

+ (nullable NSURLSessionDataTask *)POST:(NSString *)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                               progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

@end
