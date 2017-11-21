//
//  BGTokenManager.h
//  RentHouse
//
//  Created by 黄雄彪 on 2017/10/9.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGTokenManager : NSObject

+(BGTokenManager*)shareTokenManager;

-(void)getToken:(void(^)())finish;

-(BOOL)checkToken;

-(void)refreshToken:(void(^)())finish;

@end
