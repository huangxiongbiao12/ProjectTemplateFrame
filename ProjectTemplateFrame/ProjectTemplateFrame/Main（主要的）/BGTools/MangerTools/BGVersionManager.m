//
//  VersionManager.m
//  NingApartment
//
//  Created by 黄雄彪 on 2018/1/3.
//  Copyright © 2018年 sihan. All rights reserved.
//

#import "BGVersionManager.h"

// 苹果商店appid
#define APPID @"1258999193"
//app下载链接
#define APPURL @"https://itunes.apple.com/cn/app/id"APPID@"?mt=8"

@implementation BGVersionManager

#pragma mark - 检查版本更新

+(void) checkVersion:(UIViewController *)vc {
    __weak UIViewController *weakVC = vc;
    [self checkUpdateWithAppID:APPID success:^(NSDictionary *resultDic, BOOL isNewVersion, NSString *newVersion) {
        if (isNewVersion) {
            [self showUpdateView:newVersion withVC:weakVC];
        }
    } failure:^(NSError *error) {
        
    }];
    
}

+ (void)showUpdateView:(NSString *)newVersion withVC:(UIViewController*)vc
{
    NSString *alertMsg=[[@"宁巢公寓" stringByAppendingString:[NSString stringWithFormat:@"%0.1f",[newVersion floatValue]]] stringByAppendingString:@"，赶快体验最新版本吧！"];
    ZLAlertView *alert = [[ZLAlertView alloc] initWithTitle:@"发现新版本" message:alertMsg];
    [alert addBtnTitle:@"取消" action:^{
        
    }];
    [alert addBtnTitle:@"立即升级" action:^{
        NSString *str = APPURL;
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    }];
    [alert showAlertWithSender:vc];
}

#pragma mark - 检查版本更新
+ (void)checkUpdateWithAppID:(NSString *)appID success:(void (^)(NSDictionary *resultDic , BOOL isNewVersion , NSString * newVersion))success failure:(void (^)(NSError *error))failure
{
    NSString *encodingUrl=[[@"https://itunes.apple.com/cn/lookup?id=" stringByAppendingString:appID] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [BGNetworking getNoHUDCommonUrl:encodingUrl parameters:nil success:^(id responseObject) {
        NSDictionary *resultDic = responseObject;
        if (![[resultDic objectForKey:@"resultCount"] integerValue]) {
            return;
        }
        NSString * versionStr =[[[resultDic objectForKey:@"results"] objectAtIndex:0] valueForKey:@"version"];
        
//        float version =[versionStr floatValue];
        //self.iTunesLink=[[[resultDic objectForKey:@"results"] objectAtIndex:0] valueForKey:@"trackViewUrl"];
        NSDictionary *infoDic=[[NSBundle mainBundle] infoDictionary];
        NSString *currentVersion = [infoDic valueForKey:@"CFBundleShortVersionString"];
        if([self compareServerVersion:versionStr localVersion:currentVersion]){
            success(resultDic, YES, versionStr);
        }else{
            success(resultDic,NO ,versionStr);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
    
}

+ (BOOL)compareServerVersion:(NSString*)serverVersion localVersion:(NSString*)localVersion {
    
    //以"."分隔数字然后分配到不同数组
    NSArray * serverArray = [serverVersion componentsSeparatedByString:@"."];
    NSArray * localArray = [localVersion componentsSeparatedByString:@"."];
    
    for (int i = 0; i < serverArray.count; i++) {
        //以服务器版本为基准，判断本地版本位数小于服务器版本时，直接返回（并且判断为新版本，比如服务器1.5.1 本地为1.5）
        if(i > (localArray.count -1)){
            //有新版本，提示！
            return YES;
        }
        //有新版本，服务器版本对应数字大于本地
        if ( [serverArray[i] intValue] > [localArray[i] intValue]) {
            //有新版本，提示！
            return YES;
        }
    }
    return NO;
}

@end
