//
//  AppDelegate+Initialize.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/16.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "AppDelegate+Initialize.h"

#define UmengAppKey @"5860c97cc8957641890002db"//友盟推送
#define AMapKey @"0d49bf088f5f92f2ba141a8174763426"//高德地图

@implementation AppDelegate (Initialize)

-(void)setupMap
{
//    [AMapServices sharedServices].apiKey = AMapKey;
}

-(void)setUpUmengWith:(NSDictionary*)launchOptions
{
    //初始化方法,也可以使用(void)startWithAppkey:(NSString *)appKey launchOptions:(NSDictionary * )launchOptions httpsenable:(BOOL)value;这个方法，方便设置https请求。
//    [UMessage startWithAppkey:UmengAppKey launchOptions:launchOptions];
    
    
    //注册通知，如果要使用category的自定义策略，可以参考demo中的代码。
//    [UMessage registerForRemoteNotifications];
    
    //iOS10必须加下面这段代码。
//    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
//    center.delegate=self;
//    UNAuthorizationOptions types10=UNAuthorizationOptionBadge|  UNAuthorizationOptionAlert|UNAuthorizationOptionSound;
//    [center requestAuthorizationWithOptions:types10     completionHandler:^(BOOL granted, NSError * _Nullable error) {
//        if (granted) {
//            //点击允许
//            //这里可以添加一些自己的逻辑
//        } else {
//            //点击不允许
//            //这里可以添加一些自己的逻辑
//        }
//    }];
    
    //打开日志，方便调试
//    [UMessage setLogEnabled:YES];
}

@end
