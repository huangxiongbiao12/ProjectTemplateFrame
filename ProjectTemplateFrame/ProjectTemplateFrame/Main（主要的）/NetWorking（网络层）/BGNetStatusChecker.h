//
//  NetStatusData.h
//  HotelClient
//
//  Created by 黄雄彪 on 17/4/10.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface BGNetStatusChecker : NSObject

@property(nonatomic,assign)AFNetworkReachabilityStatus status;//网络状态

+(BGNetStatusChecker*)shareNetStatus;

-(void)checkNetStatus;//检查网络状态

@end
