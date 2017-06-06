//
//  NSObject+Request.h
//  HotelClient
//
//  Created by 黄雄彪 on 17/5/11.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Request)
//请求数据
+(void)requestUrl:(NSString*)url parameters:(NSDictionary*)parameters showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)requestUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;

+(void)requestNoHUDUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure;
//解析数据
+(id)parseData:(id)responseObject;
//对象转json
-(NSDictionary*)toJson;
//获取属性的类型
+(NSString*)getPropertyType:(NSString*)property;
-(NSString*)getPropertyType:(NSString*)property;

@end
