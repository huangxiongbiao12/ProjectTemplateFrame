//
//  UtilityChoiceFatherItem.m
//  PRentHouse
//
//  Created by 黄雄彪 on 17/1/6.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "DBTitleFatherItem.h"

@implementation DBTitleFatherItem

+(instancetype)itemWithTitle:(NSString*)title subTitle:(NSString*)subTitle {
    DBTitleFatherItem *model = [[self alloc]init];;
    model.title = title;
    model.subTitle = subTitle;
    return model;
}

@end
