//
//  HXBSaveTool.h
//  HotelManager
//
//  Created by 黄雄彪 on 16/3/28.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXBSaveTool : NSObject

+ (void)setObject:(id)value forKey:(NSString *)defaultName;

+ (id)objectForKey:(NSString *)defaultName;

+ (void)setValue:(id)value forKey:(NSString *)defaultName;

+ (id)valueForKey:(NSString *)defaultName;

+(void)removeObjectForKey:(NSString*)key;

@end
