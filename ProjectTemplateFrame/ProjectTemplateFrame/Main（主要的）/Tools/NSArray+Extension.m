//
//  NSArray+Extension.m
//  HotelManager
//
//  Created by 黄雄彪 on 16/8/22.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "NSArray+Extension.h"

@implementation NSArray (Extension)

-(NSString *)jsonString
{
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
