//
//  UIButton+BG_Tool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UIButton+BG_Tool.h"
#import "DefineHeader.h"

@implementation UIButton (BG_Tool)

-(void)setHighlightColor:(UIColor *)color {
    [self setBackgroundImage:[self imageFromColor:color] forState:UIControlStateHighlighted];
}

-(void)setHighlightDefaultColor {
    [self setHighlightColor:kBackgroundGrayDefautColor];
}

- (UIImage *)imageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, kScreenWidth, 49);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
