//
//  Model.h
//  PRH
//
//  Created by 黄雄彪 on 15/12/31.
//  Copyright © 2015年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+BGNetworking.h"

@interface BGBaseModel : NSObject<NSCoding,NSCopying>

//对象转json
-(NSDictionary*)toJson;
/*
 *对象中含有的模型数据对应的对象名称例如
 *@{
    @"statuses" : @"Status",===字段有statuses的数组含有的对象为Status类型
 *};
 */
@property(nonatomic,strong)NSDictionary *classInArrayDic;

@end
