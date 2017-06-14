//
//  NSObject+Request.m
//  HotelClient
//
//  Created by 黄雄彪 on 17/5/11.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "NSObject+BGNetworking.h"
#import <objc/runtime.h>
#import "BGNetworking.h"

@implementation NSObject (Request)

+(void)requestUrl:(NSString*)url parameters:(NSDictionary*)parameters showHUD:(BOOL)show success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure {
    [BGNetworking postUrl:url parameters:parameters showHUD:show success:^(id responseObject) {
        id obj = [self parseData:responseObject[@"data"]];
        success(obj);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+(void)requestUrl:(NSString*)url parameters:(NSDictionary*)parameters success:(void(^)(id responseObject)) success failure:(void(^)(NSError *error)) failure {
    [self requestUrl:url parameters:parameters showHUD:YES success:success failure:failure];
}

+(void)requestNoHUDUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [self requestUrl:url parameters:parameters showHUD:NO success:success failure:failure];
}

+(id)parseData:(id)responseObject {
    
    id obj;
    //单个对象
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        obj = [[self alloc]init];
        [obj setValuesForKeysWithDictionary:responseObject];
    }
    //        多个对象
    else if ([responseObject isKindOfClass:[NSArray class]]) {
        obj = [NSMutableArray new];
        for (NSDictionary *dic in responseObject) {
            id o = [[self alloc]init];
            [o setValuesForKeysWithDictionary:dic];
            [obj addObject:o];
        }
    }
    return obj;
}

-(NSDictionary *)toJson
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    unsigned  int count = 0;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    for (int i = 0; i < count; i++) {
        const char *cname = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:cname];
        NSString *key = [name substringFromIndex:1];
        id value = [self valueForKey:key];
        if ([value isKindOfClass:[NSString class]]&&[(NSString*)value length]) {
            [params setValue:value forKey:key];
        }
    }
    return params;
}

#pragma mark-------//获取属性的类型

+(NSString *)getPropertyType:(NSString *)property {
    //获取对象的类型objc_getClass("UserModel")
    objc_property_t p = class_getProperty(self, property.UTF8String);
    const char *cname = property_getAttributes(p);
    NSLog(@"%s==",cname);
    // 2.成员类型
    NSString *attrs = @(property_getAttributes(p));
    NSUInteger dotLoc = [attrs rangeOfString:@","].location;
    NSString *code = nil;
    NSUInteger loc = 3;
    if (dotLoc == NSNotFound) { // 没有,
        code = [attrs substringFromIndex:loc];
    } else {
        code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc-1)];
    }
    NSLog(@"%@===%@====",code,attrs);
    return code;
}

-(NSString *)getPropertyType:(NSString *)property {
    //获取对象的类型objc_getClass("UserModel")
    objc_property_t p = class_getProperty(self.class, property.UTF8String);
    if (!p) {
        return nil;
    }
    const char *cname = property_getAttributes(p);
    NSLog(@"%s==",cname);
    // 2.成员类型
    NSString *attrs = @(property_getAttributes(p));
    NSUInteger dotLoc = [attrs rangeOfString:@","].location;
    NSString *code = nil;
    NSUInteger loc = 3;
    if (dotLoc == NSNotFound) { // 没有,
        code = [attrs substringFromIndex:loc];
    } else {
        code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc-1)];
    }
    NSLog(@"%@===%@====",code,attrs);
    return code;
}


@end
