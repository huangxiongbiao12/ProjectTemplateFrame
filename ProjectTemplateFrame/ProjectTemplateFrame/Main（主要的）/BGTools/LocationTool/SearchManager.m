//
//  SearchManager.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "SearchManager.h"

@implementation SearchManager

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)startReverseGeocode:(CLLocation *)location completeionBlock:(void (^)(LocationGeocoder *, NSError *))completeion{
    self.completionBlock = completeion;
    [self startReverseGeocode:location];
}

- (void)startReverseLocation:(NSString*)adress completeionBlock:(void(^)(CLLocation *location,NSError *error))completeion
{
    self.completionLoca = completeion;
    [self startReverseLocation:adress];
}
-(void)startReverseLocation:(NSString*)adress
{
    [self.gecoder geocodeAddressString:adress completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *mark = [placemarks lastObject];
        self.completionLoca(mark.location,error);
    }];
}

- (void)startReverseGeocode:(CLLocation *)location{
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:@"zh-hans",nil] forKey:@"AppleLanguages"];
    [self.gecoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error || placemarks.count == 0) {
            self.completionBlock(nil,error);
        }else{
            CLLocationCoordinate2D coor = [BGLocationConverter transformFromWGSToGCJ:location.coordinate];
            LocationGeocoder *locationGeocoder = [[LocationGeocoder alloc] init];
            CLPlacemark *placemark = [placemarks firstObject];
            NSDictionary *dictionary = [[placemarks objectAtIndex:0] addressDictionary];
            locationGeocoder.location = [[CLLocation alloc]initWithLatitude:coor.latitude longitude:coor.longitude];
            locationGeocoder.formatterAddress = dictionary[@"Name"];
            locationGeocoder.province = dictionary[@"State"];
            locationGeocoder.city = dictionary[@"City"];
            locationGeocoder.district = dictionary[@"SubLocality"];
            locationGeocoder.locality = placemark.locality;
            locationGeocoder.adress = [NSString stringWithFormat:@"%@%@%@%@",dictionary[@"City"],dictionary[@"SubLocality"],dictionary[@"Thoroughfare"],dictionary[@"SubThoroughfare"]];
            self.completionBlock(locationGeocoder,nil);
        }
    }];
}


#pragma mark - Getter and Setter
- (CLGeocoder*)gecoder{
    if (_gecoder == nil) {
        _gecoder = [[CLGeocoder alloc] init];
    }
    return _gecoder;
}

@end
