//
//  NetStatusData.m
//  HotelClient
//
//  Created by 黄雄彪 on 17/4/10.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "NetStatusData.h"

static NetStatusData *_netStatus = nil;

@implementation NetStatusData

+(NetStatusData *)shareNetStatus {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_netStatus) {
            _netStatus = [NetStatusData new];
        }
    });
    return _netStatus;
}

-(void)checkNetStatus {
    AFNetworkReachabilityManager *manager=[AFNetworkReachabilityManager sharedManager];
    __weak AFNetworkReachabilityManager *weakManager = manager;
    [manager startMonitoring];
    //检测网络状态有网络，网络请求数据，没网络提示
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        self.status = status;
        if (!status) {//未连接
            UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
            UILabel *tipsLable;
            if (!tipsLable) {
                tipsLable = [[UILabel alloc] initWithFrame:(CGRect){kScreenWidth/2,kScreenHeight/2+80,110,33}];
                tipsLable.textColor = [UIColor whiteColor];
                tipsLable.textAlignment = NSTextAlignmentCenter;
                tipsLable.centerX = window.centerX;
                tipsLable.backgroundColor = [UIColor blackColor];
                tipsLable.text = @"网络未连接";
            }
            [window addSubview:tipsLable];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [tipsLable removeFromSuperview];
            });
            
            return;
        }else{//连接请求数据
            //            [self requstData:type];
        }
        [weakManager stopMonitoring];
    }];
}

@end
