//
//  BGCommonFormModel.m
//  HotelManager
//
//  Created by 黄雄彪 on 16/3/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGCommonFormModel.h"

@implementation BGCommonFormModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleFont = kFont(15);
        _titleColor = kBlackMainColor;
        
        _subTitleFont = kFont(14);
        _subTitleColor = kBlackMainColor1;
        
        _contentFont = kFont(14);
        _contentColor = kBlackMainColor;
        
        _accessoryFont = kFont(13);
        _accessoryColor = kNavBarMainColor;
        _accessoryBackgroundColor = [UIColor clearColor];
    }
    return self;
}

@end
