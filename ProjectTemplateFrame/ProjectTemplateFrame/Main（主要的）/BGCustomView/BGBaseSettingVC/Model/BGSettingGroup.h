//
//  GroupModel.h
//  testBGSettingDemo
//
//  Created by 黄雄彪 on 16/3/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGSettingItem.h"

@interface BGSettingGroup : NSObject

@property(nonatomic,copy)NSString *headerStr;

@property(nonatomic,copy)NSString *footterStr;

@property(nonatomic,strong)NSMutableArray *items;

@end
