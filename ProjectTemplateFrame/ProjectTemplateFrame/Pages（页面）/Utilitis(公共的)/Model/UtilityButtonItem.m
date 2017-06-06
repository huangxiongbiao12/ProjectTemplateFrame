//
//  UtilityButtonItem.m
//  PRentHouse
//
//  Created by 黄雄彪 on 17/1/4.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UtilityButtonItem.h"

@implementation UtilityButtonItem
+(UtilityButtonItem *)itemWithImage:(NSString *)imageName title:(NSString *)title destiVC:(NSString *)destiVC {
    UtilityButtonItem *item = [UtilityButtonItem new];
    item.imageName = imageName;
    item.title = title;
    item.destiVC = destiVC;
    return item;
}
@end
