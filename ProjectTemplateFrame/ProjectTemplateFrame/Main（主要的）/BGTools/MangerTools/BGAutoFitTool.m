//
//  BGAutoFitTool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGAutoFitTool.h"
#import "DefineHeader.h"

@implementation BGAutoFitTool

/**
 *  字体适配屏幕尺寸
 *
 */
+(void)setFontAutoForView:(UIView*)view {
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
