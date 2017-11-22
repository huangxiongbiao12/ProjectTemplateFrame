//
//  EncryChecker.h
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/11/21.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryChecker : NSObject


/**
 匹配接口名称是否需要加密，及需要加密的参数，将参数加密处理

 @param url 需要加密的接口名称
 @param param 参数集合
 */
+(NSDictionary*)encryUrl:(NSString*)url param:(NSDictionary*)param;


/**
 匹配需要解密的接口，将data解密

 @param url 匹配的接口名称
 @param data 需要处理的数据
 */
+(NSData*)decryUrl:(NSString*)url data:(NSData*)data;

@end
