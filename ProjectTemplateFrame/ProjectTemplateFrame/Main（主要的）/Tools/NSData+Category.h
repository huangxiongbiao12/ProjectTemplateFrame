//
//  NSData+Category.h
//  转码测试
//
//  Created by 黄雄彪 on 16/4/19.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Category)

+(NSData*)dataWithHexString:(NSString*)hexString;

+(NSString*)hexStringWithData:(NSData*)data;

@end
