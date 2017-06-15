//
//  BGSettingModel.h
//  testBGSettingDemo
//
//  Created by 黄雄彪 on 16/3/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,ItemType) {
    
    ItemTypeArrow,
    ItemTypeSwitch,
    ItemTypeLabel
    
};

typedef void(^ItemOptionBlock)();

@interface BGSettingItem : NSObject

@property(nonatomic,copy)NSString *iconStr;

@property(nonatomic,copy)NSString *title;

//label下的参数
@property(nonatomic,copy)NSString *text;

@property(nonatomic,assign)ItemType itemType;

@property(nonatomic,copy)ItemOptionBlock option;
//箭头下的参数
@property(nonatomic,copy)NSString *desVcName;
//swith的开关状态
//只需要设置开关的key就可以不需要设置开关量
@property(nonatomic,copy)NSString *onForKey;
//设置开关
@property(nonatomic,assign)BOOL onSwitch;
//默认开关
@property(nonatomic,assign)BOOL defaultIsOn;


+(BGSettingItem*)itemWithIconStr:(NSString*)iconStr title:(NSString*)title itemType:(ItemType)itemType;

@end
