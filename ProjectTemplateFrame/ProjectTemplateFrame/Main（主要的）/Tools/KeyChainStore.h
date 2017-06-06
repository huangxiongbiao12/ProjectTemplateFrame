//
//  KeyChainStore.h
//  LoveE
//
//  Created by 黄雄彪 on 16/4/20.
//  Copyright © 2016年 huangxiongbiao. All rights reserved.
//

#import <Foundation/Foundation.h>

#define  KEY_USERNAME_PASSWORD @"com.company.app.usernamepassword"
#define  KEY_USERNAME @"com.company.app.username"
#define  KEY_PASSWORD @"com.company.app.password"

@interface KeyChainStore : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)deleteKeyData:(NSString *)service;

@end
