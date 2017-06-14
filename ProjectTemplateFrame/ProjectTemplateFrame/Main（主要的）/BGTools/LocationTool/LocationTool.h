//
//  LocationTool.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/11/3.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationManager.h"
#import "SearchManager.h"
#import "BGLocationConverter.h"

@interface LocationTool : NSObject

@property (nonatomic, strong) LocationManager *locationManager;
@property (nonatomic, strong) SearchManager *searchManager;
@property(nonatomic,strong)LocationGeocoder *locationGeocoder;
+(LocationTool*)shareLocation;
//返回的是火星坐标系
-(void)locationActionFinish:(void(^)(LocationGeocoder *locationGeocoder, NSError *error))finish;
//计算记录
+(int)distanceLocation:(CLLocation*)location destination:(CLLocation*)destinate
;
@end
