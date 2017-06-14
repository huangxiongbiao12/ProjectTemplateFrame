//
//  NSData+BG_Tool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
//#import "GTMBase64.h"

@interface NSData (BG_Tool)

//  des加密 key 为16进制的字符串8个字节（16位长“0120018020124578”）
+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;

// des解密  key 为16进制的字符串8个字节（16位长@“0120018020124578”）
+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;

//  3des解密  key 为16进制的字符串16个字节 前面八个字节解密后面八个字节加密（32位长@“0120018020124578”）  3des解密原理是des解密加密解密
+ (NSData *)threeDESDecrypt:(NSData *)data WithKey:(NSString *)key;

//  3des加密  key 为16进制的字符串16个字节 前面八个字节加密后面八个字节解密（32位长@“0120018020124578”）  3des加密原理是des加密解密加密
+ (NSData *)threeDESEncrypt:(NSData *)data WithKey:(NSString *)key;

//  16进制字符串转data
+(NSData*)dataWithHexString:(NSString*)hexString;

//  data转成16进制字符串（0X11）一个字节
+(NSString*)hexStringWithData:(NSData*)data;

@end
