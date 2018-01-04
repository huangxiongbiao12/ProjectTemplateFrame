//
//  BGNetworking.h
//  ProjectFrame
//
//  Created by 黄雄彪 on 16/1/15.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGNetStatusChecker.h"

@interface BGNetworking : NSObject

+ (void)getUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)getNoHUDUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postUrl:(NSString*)url parameters:(NSDictionary*)parameters showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postNoTokenUrl:(NSString*)url parameters:(NSDictionary*)parameters showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postNoHUDUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postCommonUrl:(NSString*)url parameters:(NSDictionary*)parameters  success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postNoHUDCommonUrl:(NSString*)url parameters:(NSDictionary*)parameters  success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)postCommonUrl:(NSString*)url parameters:(NSDictionary*)parameters showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)getCommonUrl:(NSString*)url parameters:(NSDictionary*)parameters  success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)getNoHUDCommonUrl:(NSString*)url parameters:(NSDictionary*)parameters  success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)getCommonUrl:(NSString*)url parameters:(NSDictionary*)parameters showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+ (nullable NSURLSessionDataTask *)POST:(NSString *_Nullable)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData>_Nullable formData))block
                                success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

+ (nullable NSURLSessionDataTask *)POST:(NSString *_Nullable)URLString
                             parameters:(nullable id)parameters
              constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData>_Nullable formData))block
                               progress:(nullable void (^)(NSProgress * _Nullable uploadProgress))uploadProgress
                                success:(nullable void (^)(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject))success
                                failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error))failure;

@end
