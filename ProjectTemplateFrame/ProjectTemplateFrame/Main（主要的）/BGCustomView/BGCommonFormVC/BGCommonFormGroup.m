//
//  BGCommonFormGroup.m
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGCommonFormGroup.h"

@implementation BGCommonFormGroup

-(NSMutableArray *)items
{
    if (!_items) {
        _items = [NSMutableArray array];
    }
    return _items;
}

@end
