//
//  EncryChecker.m
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/11/21.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "EncryChecker.h"
#import "RandomKeyManager.h"

@implementation EncryChecker

static NSDictionary *_encryConfDic = nil;

static void initEncryConf() {
    if (!_encryConfDic) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"security" ofType:@"plist"];
        _encryConfDic = [[NSMutableDictionary alloc] initWithContentsOfFile:filePath];
    }
}

+(NSDictionary*)encryUrl:(NSString *)url param:(NSDictionary *)param {
    initEncryConf();
    NSMutableDictionary *paramResult = [[NSMutableDictionary alloc] initWithDictionary:param];
    NSRange range = [url rangeOfString:kHost];
    NSString *path = [url substringFromIndex:range.length];
    NSDictionary *paramConf = _encryConfDic[@"encryption"][path];
    // 若加密配置文件中存在该路径，继续匹配需要加密的参数
    if (paramConf) {
        //  若配置文件的参数为空，则全部加密，否者匹配对应参数
        for (NSString *key in param) {
            if (paramConf[key]||paramConf.count==0) {
                NSString *value = param[key];
                [paramResult setValue:[NSString AES128Encrypt:value key:[RandomKeyManager shareRandomKey].getRandomKey] forKey:key];
            }
            
        }
    }
    return (NSDictionary*)paramResult;
}

+(NSData*)decryUrl:(NSString *)url data:(NSData *)data {
    NSRange range = [url rangeOfString:kHost];
    NSString *path = [url substringFromIndex:range.length];
    // 若加密配置文件中存在该路径，则对data进行解密操作
    if (_encryConfDic[@"decryption"][path]) {
        NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSString *responseStr = [[NSString AES128Decrypt:dataStr key:[RandomKeyManager shareRandomKey].getRandomKey] stringByReplacingOccurrencesOfString:@"\0" withString:@""];
        DDLog(@"encrey:%@;\ndecry:%@",dataStr,responseStr);
        data = [responseStr dataUsingEncoding:NSUTF8StringEncoding];
    }
    return data;
}

@end
