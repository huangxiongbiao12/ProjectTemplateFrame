//
//  RandomKeyManager.m
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/11/21.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "RandomKeyManager.h"
#import "NSData+BG_Tool.h"

//有效时间长
#define EXPIRETIME (30)

@interface RandomKeyManager()
@property(nonatomic,strong)NSDate *expireDate;
@property(nonatomic,copy)NSString *randomKey;
@end

@implementation RandomKeyManager

static RandomKeyManager *_randomManager = nil;

+(RandomKeyManager *)shareRandomKey {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_randomManager==nil) {
            _randomManager = [RandomKeyManager new];
        }
    });
    return _randomManager;
}

-(NSString *)getRandomKey {
    // 检查随机key是否有效,   有效yes 无效为no
    if ([self checkDate]) {//有效直接返回
        if (!self.randomKey.length) {
            self.randomKey = [self createRandomKey];
        }
    } else {//无效随机生成
        self.randomKey = [self createRandomKey];
    }
    return self.randomKey;
}


/**
 检查随机key是否有效

 @return 有效返回yes 无效为no
 */
-(BOOL)checkDate {
    // 如果失效时间不存在或者当前时间大于失效时间，重新生成随机key。更新失效时间
    if (!self.expireDate||[self.expireDate timeIntervalSinceDate:[NSDate date]] < 0) {
        NSDate *invalidate = [[NSDate date] dayInTheFollowingMinute:EXPIRETIME];
        self.expireDate = invalidate;
        return NO;
    }
    return YES;
}

-(NSString*)createRandomKey {
    NSString *string = [[NSString alloc]init];
    for (int i = 0; i < 16; i++) {
        int number = arc4random() % 36;
        if (number < 10) {
            int figure = arc4random() % 10;
            NSString *tempString = [NSString stringWithFormat:@"%d", figure];
            string = [string stringByAppendingString:tempString];
        }else {
            int figure = (arc4random() % 26) + 97;
            char character = figure;
            NSString *tempString = [NSString stringWithFormat:@"%c", character];
            string = [string stringByAppendingString:tempString];
        }
    }
    DDLog(@"%@", string);
    return string;
}

@end
