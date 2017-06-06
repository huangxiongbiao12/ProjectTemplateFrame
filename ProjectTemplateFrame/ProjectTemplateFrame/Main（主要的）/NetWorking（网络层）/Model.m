//
//  Model.m
//  PRH
//
//  Created by 黄雄彪 on 15/12/31.
//  Copyright © 2015年 sihan. All rights reserved.
//

#import "Model.h"

@implementation Model

-(void)setValue:(id)value forKey:(NSString *)key{
    
    if ([value isKindOfClass:[NSNumber class]]) {
        [self setValue:[NSString stringWithFormat:@"%@",value] forKey:key];
    }else if ([value isKindOfClass:[NSArray class]]) {
        
    }else{
        if (!value||[value isKindOfClass:[NSNull class]]) {
            [super setValue:@"" forKey:key];
        }else{
            [super setValue:value forKey:key];
        }
    }
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
        if ([key isEqualToString:@"description"]) {
            [self setValue:value forKey:@"descriptionStr"];
        }else if ([key isEqualToString:@"id"]){
            [self setValue:value forKey:@"Id"];
        }else if([key isEqualToString:@"newPrice"]){
            [self setValue:value forKey:@"price"];
        }else if([key isEqualToString:@"code"]){
            [self setValue:value forKey:@"codePara"];
        }else{
            DDLog(@"没有key＝＝%@",key);
        }
}

-(void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues {
    for (NSString *key in keyedValues) {
        id value = keyedValues[key];
        //对象中含有对象数组
        if ([value isKindOfClass:[NSArray class]]) {
            if (![self.classInArrayDic objectForKey:key]) {
                DDLog(@"请给数组对象对应类型");
                continue;
            }
            //设置数组的值
            NSMutableArray *values = [NSMutableArray new];
            //取出数组含有对象类型
            Class ObjectType = NSClassFromString(self.classInArrayDic[key]);
            DDLog(@"%@",ObjectType);
            for (NSDictionary *dic in value) {
                 //获取对象类型生成实例
                id obj = [[ObjectType alloc]init];
                [obj setValuesForKeysWithDictionary:dic];
                [values addObject:obj];
            }
            [self setValue:values forKey:key];
        }else if ([value isKindOfClass:[NSDictionary class]]) {//对象中含有对象
            //获取对象的类型
            NSString *type = [self getPropertyType:key];
            if (type.length) {
                DDLog(@"请给对象对应类型");
                continue;
            }
            //获取对象类型生成实例
            Class ObjectType = NSClassFromString(type);
            id obj = [[ObjectType alloc]init];
            [obj setValuesForKeysWithDictionary:value];
            [self setValue:obj forKey:key];
        }else {
            [self setValue:value forKey:key];
        }
    }
}

-(NSDictionary *)toJson
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    unsigned  int count = 0;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    for (int i = 0; i < count; i++) {
        const char *cname = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:cname];
        NSString *key = [name substringFromIndex:1];
        id value = [self valueForKey:key];
        if ([value isKindOfClass:[NSString class]]&&[(NSString*)value length]) {
            [params setValue:value forKey:key];
        }
    }
    return params;
}

#pragma mark-------NSCoding,归接档协议,运行时

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned  int count = 0;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    for (int i = 0; i < count; i++) {
        const char *cname = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:cname];
        NSString *key = [name substringFromIndex:1];
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
    }
    
}
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        
        unsigned  int count = 0;
        Ivar *ivars = class_copyIvarList(self.class, &count);
        
        for (int i = 0; i < count; i++) {
            const char *cname = ivar_getName(ivars[i]);
            NSString *name = [NSString stringWithUTF8String:cname];
            NSString *key = [name substringFromIndex:1];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    unsigned  int count = 0;
    Ivar *ivars = class_copyIvarList(self.class, &count);
    
    for (int i = 0; i < count; i++) {
        const char *cname = ivar_getName(ivars[i]);
        NSString *name = [NSString stringWithUTF8String:cname];
        NSString *key = [name substringFromIndex:1];
        id value = [self valueForKey:key];
        [copy setValue:value forKey:key];
    }
    return copy;
}


@end
