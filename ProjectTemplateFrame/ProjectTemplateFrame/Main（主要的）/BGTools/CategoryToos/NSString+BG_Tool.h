//
//  NSString+BG_Tool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

#define iOSLess8_0 [[[UIDevice currentDevice] systemVersion] doubleValue] < 8.0

@interface NSString (BG_Tool)

+ (BOOL) validateEmail:(NSString *)email;
+ (BOOL) validateMobile:(NSString *)mobile;
+ (BOOL) validateCarNo:(NSString *)carNo;
+ (BOOL) validateCarType:(NSString *)CarType;
+ (BOOL) validateUserName:(NSString *)name;
+ (BOOL) validateNickname:(NSString *)nickname;
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

- (BOOL) validateNumber;
- (BOOL) validateEmail;
- (BOOL) validateMobile;
- (BOOL) validateCarNo;
- (BOOL) validateCarType;
- (BOOL) validateUserName;
- (BOOL) validateNickname;
- (BOOL) validateIdentityCard;
- (BOOL) validatePassport;

// 适配iOS8 之前的方法
#ifdef  iOSLess8_0
-(BOOL)containsString:(NSString *)str;
#endif

+ (const char *)UnicodeToISO88591:(NSString *)src;

+ (NSString *)_859ToUTF8:(NSString *)oldStr;

+ (NSString *)stringFromHexString:(NSString *)hexString;

+ (NSString *)hexStringFromString:(NSString *)string;

+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;

+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;

+ (NSString *)md5:(NSString *)str;

//加密
- (NSString *) AES256_Encrypt:(NSString *)key;
//解密
- (NSString *) AES256_Decrypt:(NSString *)key;

+ (NSString*) AES128Encrypt:(NSString *)plainText key:(NSString*)key;

+ (NSString*) AES128Decrypt:(NSString *)encryptText key:(NSString*)key;

@end
