//
//  LocationManager.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface LocationManager : UIView<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *loactionManager;

@property (nonatomic, copy) void (^startBlock)(void);

@property (nonatomic, copy) void (^successCompletionBlock)(CLLocation *location);

@property (nonatomic, copy) void (^failureCompletionBlock)(CLLocation *location,NSError *error);


- (void)startWithBlock:(void(^)(void))start
       completionBlock:(void(^)(CLLocation *location))success
               failure:(void(^)(CLLocation *location, NSError *error))failure;

@end
