//
//  BGTokenManager.m
//  RentHouse
//
//  Created by 黄雄彪 on 2017/10/9.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGTokenManager.h"
#import "UserModel.h"

@interface BGTokenManager ()
{
    NSDate *_expairDate;
}
@property(nonatomic,strong,readwrite)NSDate *expairDate;

@end

@implementation BGTokenManager

static BGTokenManager *tokenManager = nil;

+(BGTokenManager *)shareTokenManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (tokenManager==nil) {
            tokenManager = [BGTokenManager new];
        }
    });
    return tokenManager;
}

-(void)getToken:(void (^)())finish {
    
    if ([self checkToken]) {
        finish();
    }else {
        [self refreshToken:^{
            finish();
        }];
    }
    
}


-(BOOL)checkToken {
    
    if (!self.expairDate) {
        return NO;
    }
    NSDate *nowDate = [NSDate date];
    BOOL validate = [self.expairDate timeIntervalSinceDate:nowDate] > 50;
    if (validate) {
        self.expairDate = [NSDate dateWithTimeIntervalSinceNow:30*60];
    }
    return validate;
}

-(void)refreshToken:(void(^)())finish {
    //刷新token
    NSString *userName = [BGSaveTool objectForKey:kUserName];
    NSString *pw = [BGSaveTool objectForKey:kPW];
    if (userName&&pw) {
//        [BGNetworking postNoTokenUrl:kLoginCommonUrl parameters:@{@"mobilePhone":userName,@"password":pw} success:^(id responseObject) {
//            UserModel *user = [UserModel new];
//            [user setValuesForKeysWithDictionary:responseObject[@"data"]];
//            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:user];
//            //账号密码
//            self.expairDate = [NSDate dateWithTimeIntervalSinceNow:30*60];
//            [BGSaveTool setObject:user.token forKey:kToken];
//            [BGSaveTool setObject:data forKey:kUser];
//            [BGSaveTool setValue:@"klofon" forKey:kLogin];
//            [BGSaveTool setObject:user.landlordId forKey:kUserID];
//            finish();
//        } failure:^(NSError *error) {
//            finish();
//        }];
    }else {
        finish();
    }
}

-(void)setExpairDate:(NSDate *)expairDate {
    _expairDate = expairDate;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [BGSaveTool setObject:expairDate forKey:kTokenExpairDate];
    });
}


-(NSDate *)expairDate {
    if (!_expairDate) {
        if ([BGSaveTool objectForKey:kTokenExpairDate]) {
            _expairDate = [BGSaveTool objectForKey:kTokenExpairDate];
        }
    }
    return _expairDate;
}

@end
