//
//  SearchManager.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "LocationGeocoder.h"
#import "BGLocationConverter.h"

@interface SearchManager : NSObject

@property (nonatomic, strong) CLGeocoder *gecoder;

@property (nonatomic, copy) void (^completionBlock)(LocationGeocoder *locationGeocoder,NSError *error);
@property (nonatomic, copy) void (^completionLoca)(CLLocation *location,NSError *error);

//坐标装地理位置，//输入的是国际坐标系
- (void)startReverseGeocode:(CLLocation*)location completeionBlock:(void(^)(LocationGeocoder *locationGeocoder,NSError *error))completeion;

//地理位置装坐标，//返回的是火星坐标系
- (void)startReverseLocation:(NSString*)adress completeionBlock:(void(^)(CLLocation *location,NSError *error))completeion;

@end
