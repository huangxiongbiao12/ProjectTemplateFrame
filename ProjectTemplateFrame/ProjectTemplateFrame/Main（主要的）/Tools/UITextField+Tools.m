//
//  UITextField+Tools.m
//  NingApartment
//
//  Created by 黄雄彪 on 17/5/16.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UITextField+Tools.h"

@implementation UITextField (Tools)

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
