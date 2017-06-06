//
//  NSObject+Category.h
//  PrecisionLock
//
//  Created by 黄雄彪 on 15/11/25.
//  Copyright © 2015年 马强. All rights reserved.
//

#import <Foundation/Foundation.h>

#define iOSLess8_0 [[[UIDevice currentDevice] systemVersion] doubleValue] < 8.0

@interface NSString (Category)

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

#ifdef  iOSLess8_0
-(BOOL)containsString:(NSString *)str;
#endif



@end
