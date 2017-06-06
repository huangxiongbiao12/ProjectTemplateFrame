//
//  UtilityAutoSizeTool.m
//  PRentHouse
//
//  Created by 黄雄彪 on 17/1/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UtilityAutoSizeTool.h"

@implementation UtilityAutoSizeTool

/**
 *  适配屏幕尺寸
 *
 */
+(void)setViewAuto:(UIView*)view {
    if ([view isKindOfClass:[UILabel class]]) {
        UILabel *label = (UILabel*)view;
        label.font = [self fontAuto:label.font];
    }else if ([view isKindOfClass:[UIButton class]]) {
        UIButton *label = (UIButton*)view;
        label.titleLabel.font = [self fontAuto:label.titleLabel.font];
    }
}

+(UIFont*)fontAuto:(UIFont*)font {
    return [UIFont systemFontOfSize:kAutoSizeY(font.pointSize)];
}

+(void)setConstantAuto:(NSLayoutConstraint*)constraint {
    constraint.constant = kAutoSizeY(constraint.constant);
}

@end
