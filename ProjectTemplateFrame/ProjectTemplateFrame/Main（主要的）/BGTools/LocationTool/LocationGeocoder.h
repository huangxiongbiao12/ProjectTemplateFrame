//
//  LocationGeocoder.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationGeocoder : NSObject

@property(nonatomic,copy)CLLocation* location;//火星坐标
@property (nonatomic, copy) NSString *formatterAddress;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *district;
@property (nonatomic, copy) NSString *locality;
@property (nonatomic, copy) NSString *adress;
@end
