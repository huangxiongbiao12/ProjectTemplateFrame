//
//  BGSettingModel.m
//  testBGSettingDemo
//
//  Created by 黄雄彪 on 16/3/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGSettingItem.h"
#import "BGSaveTool.h"

@implementation BGSettingItem

+(BGSettingItem *)itemWithIconStr:(NSString *)iconStr title:(NSString *)title itemType:(ItemType)itemType
{
    BGSettingItem *item = [[BGSettingItem alloc] init];
    item.iconStr = iconStr;
    item.title = title;
    item.itemType = itemType;
    return item;
}


-(void)setOnSwitch:(BOOL)onSwitch
{
    if (_onForKey) {
       [BGSaveTool setObject:[NSNumber numberWithBool:onSwitch] forKey:_onForKey];
    }
}
//
-(BOOL)onSwitch
{
    if ([BGSaveTool objectForKey:_onForKey]) {
        return [[BGSaveTool objectForKey:_onForKey] boolValue];
    }
    //默认开关
    return self.defaultIsOn;
}

-(void)setOnForKey:(NSString *)onForKey
{
    
    _onForKey = onForKey;
    
}


@end
