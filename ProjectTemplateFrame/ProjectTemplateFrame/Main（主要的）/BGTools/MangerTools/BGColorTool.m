//
//  BGColorTool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/14.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGColorTool.h"
#import "DefineHeader.h"

@implementation BGColorTool

+ (UIImage *)imageFromColor:(UIColor *)color
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
