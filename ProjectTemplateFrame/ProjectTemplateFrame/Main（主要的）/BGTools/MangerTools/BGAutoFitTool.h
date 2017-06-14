//
//  BGAutoFitTool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BGAutoFitTool : NSObject

+(void)setFontAutoForView:(UIView*)view;
+(UIFont*)fontAuto:(UIFont*)font;
+(void)setConstantAuto:(NSLayoutConstraint*)constraint;

@end
