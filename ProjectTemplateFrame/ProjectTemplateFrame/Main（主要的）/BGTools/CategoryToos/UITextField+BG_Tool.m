//
//  UITextField+BG_Tool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UITextField+BG_Tool.h"

@implementation UITextField (BG_Tool)

-(UIFont *)placeFont {
    return [self valueForKeyPath:@"_placeholderLabel.font"];
}

-(UIColor *)placeColor {
    return [self valueForKeyPath:@"_placeholderLabel.textColor"];
}

-(void)setPlaceFont:(UIFont *)placeFont {
    
    [self setValue:[UIFont systemFontOfSize:15] forKeyPath:@"_placeholderLabel.font"];
}

-(void)setPlaceColor:(UIColor *)placeColor {
    [self setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
}

@end
