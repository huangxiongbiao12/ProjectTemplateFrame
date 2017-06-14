//
//  LocationManager.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "LocationManager.h"
#import "BGLocationConverter.h"

static CLLocation *oldLocation;

@implementation LocationManager

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)startWithBlock:(void (^)(void))start completionBlock:(void (^)(CLLocation *))success failure:(void (^)(CLLocation *, NSError *))failure{
    [self setStartBlock:start completionBlock:success failure:failure];
    [self startLocation];
}


- (void)setStartBlock:(void(^)(void))start completionBlock:(void(^)(CLLocation*))success failure:(void (^)(CLLocation *, NSError *))failure{
    self.startBlock = start;
    self.successCompletionBlock = success;
    self.failureCompletionBlock = failure;
}


- (void)startLocation{
    self.startBlock();
    self.loactionManager.delegate = self;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        [self.loactionManager requestWhenInUseAuthorization];
        [self.loactionManager requestAlwaysAuthorization];
    }
    self.loactionManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self.loactionManager.distanceFilter = 10.0f;
    [self.loactionManager startUpdatingLocation];
}


#pragma mark - CLLocationManager Delegate
//定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    [self.loactionManager stopUpdatingLocation];
    oldLocation = [locations lastObject];
    self.successCompletionBlock(oldLocation);
}

//定位失败
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    [self.loactionManager stopUpdatingLocation];
    self.failureCompletionBlock(oldLocation,error);
}


#pragma mark - Getter and Setter
- (CLLocationManager*)loactionManager{
    if (_loactionManager == nil) {
        _loactionManager = [[CLLocationManager alloc] init];
        _loactionManager.delegate = self;
    }
    return _loactionManager;
}

@end
