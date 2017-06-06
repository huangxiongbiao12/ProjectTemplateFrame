//
//  UtilityAutoSizeTool.h
//  PRentHouse
//
//  Created by 黄雄彪 on 17/1/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilityAutoSizeTool : NSObject
+(void)setViewAuto:(UIView*)view;
+(UIFont*)fontAuto:(UIFont*)font;
+(void)setConstantAuto:(NSLayoutConstraint*)constraint;
@end
