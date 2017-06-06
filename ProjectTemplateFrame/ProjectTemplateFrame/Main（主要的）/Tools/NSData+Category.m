//
//  NSData+Category.m
//  转码测试
//
//  Created by 黄雄彪 on 16/4/19.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "NSData+Category.h"

@implementation NSData (Category)

//返回的16进制根字符串一样
+(NSData*)dataWithHexString:(NSString*)hexString{
    
    char *myBuffer = (char *)malloc((int)[hexString length] / 2 + 1);
    bzero(myBuffer, [hexString length] / 2 + 1);
    for (int i = 0; i < [hexString length] - 1; i += 2) {
        unsigned int anInt;
        NSString * hexCharStr = [hexString substringWithRange:NSMakeRange(i, 2)];
        NSScanner * scanner = [[NSScanner alloc] initWithString:hexCharStr];
        [scanner scanHexInt:&anInt];
        myBuffer[i / 2] = (char)anInt;
    }
    NSString *unicodeString = [NSString stringWithCString:myBuffer encoding:4];
    
    return [unicodeString dataUsingEncoding:NSUTF8StringEncoding];
    
}

//返回和16进制一样的字符串
+(NSString *)hexStringWithData:(NSData *)data
{
    NSData *myD = data;
    Byte *bytes = (Byte *)[myD bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++)
        
    {
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        
        if([newHexStr length]==1)
            
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        
        else
            
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
    
}

@end

