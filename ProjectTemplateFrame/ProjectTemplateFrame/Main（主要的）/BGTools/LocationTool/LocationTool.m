//
//  LocationTool.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/11/3.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "LocationTool.h"

@interface LocationTool ()<UIAlertViewDelegate>

@end

@implementation LocationTool


+(LocationTool*)shareLocation
{
    static LocationTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!tool) {
            tool = [[LocationTool alloc]init];
        }
    });
    return tool;
}

-(void)locationActionFinish:(void(^)(LocationGeocoder *locationGeocoder, NSError *error))finish
{
    [self locationOpenTip];
    [self.locationManager startWithBlock:^{
        
    } completionBlock:^(CLLocation *location) {
        [self.searchManager startReverseGeocode:location completeionBlock:^(LocationGeocoder *locationGeocoder, NSError *error) {
            if (!error) {
                self.locationGeocoder = locationGeocoder;
                finish(locationGeocoder,nil);
            }else{
                finish(locationGeocoder,error);
            }
        }];
    } failure:^(CLLocation *location, NSError *error) {
        if (error) {
           finish(nil,error);
        }else{
           finish(nil,error);
        }
    }];

}

+(int)distanceLocation:(CLLocation*)location destination:(CLLocation*)destinate
{
    CLLocation *lastLocation = [[CLLocation alloc] initWithLatitude:destinate.coordinate.latitude longitude:destinate.coordinate.longitude];
    CLLocation *nowLocation = [[CLLocation alloc] initWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
    
    int distanceMeters = [lastLocation distanceFromLocation:nowLocation];
    return distanceMeters;
}

#pragma mark-------定位提示

-(void)locationOpenTip {
    //请开启定位服务
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (kCLAuthorizationStatusDenied == status || kCLAuthorizationStatusRestricted == status)
    {
        //读取本地数据
        NSString * isPositioning = [[NSUserDefaults standardUserDefaults] valueForKey:@"isPositioning"];
        if (isPositioning == nil)//提示
        {
            UIAlertView * positioningAlertivew = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"为了更好的体验,请到设置->隐私->定位服务中开启!【xxxAPP】定位服务,已便获取附近信息!" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:@"永不提示",@"残忍拒绝",nil];
            positioningAlertivew.tag = 30;
            [positioningAlertivew show];
        }
    }else//开启的
    {
        //需要删除本地字符
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults removeObjectForKey:@"isPositioning"];
        [userDefaults synchronize];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0)//确认跳转设置
    {
        NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    else if (buttonIndex == 1)//永不提示
    {
        //存入本地
        NSString * isPositioning = @"永不提示";
        NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:isPositioning forKey:@"isPositioning"];
    }
    else//残忍拒绝
    {
        //取消不做提示
    }
}


#pragma mark-------
- (LocationManager*)locationManager{
    if (_locationManager == nil) {
        _locationManager = [[LocationManager alloc] init];
    }
    return _locationManager;

}
- (SearchManager*)searchManager{
    if (_searchManager == nil) {
        _searchManager = [[SearchManager alloc] init];
    }
    return _searchManager;
}
-(LocationGeocoder *)locationGeocoder
{
    if (!_locationGeocoder) {
        [self locationActionFinish:^(LocationGeocoder *locationGeocoder, NSError *error) {
        }];
    }
    return _locationGeocoder;
}

@end
