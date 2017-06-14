//
//  NSMutableDictionary+BG_Tool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/14.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "NSMutableDictionary+BG_Tool.h"

@implementation NSMutableDictionary (BG_Tool)

-(void)setFilterValue:(id)value forKey:(NSString *)key {
    if (!value) {
        return;
    }
    [self setValue:value forKey:key];
}

@end
