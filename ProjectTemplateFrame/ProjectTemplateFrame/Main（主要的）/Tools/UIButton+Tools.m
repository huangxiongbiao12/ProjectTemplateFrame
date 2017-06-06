//
//  UIButton+Tools.m
//  HotelClient
//
//  Created by 黄雄彪 on 17/3/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UIButton+Tools.h"

@implementation UIButton (Tools)

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    
}

-(void)setUpClickColor:(UIColor *)color {
    [self setBackgroundImage:[HXBColor imageFromColor:color] forState:UIControlStateHighlighted];
}

-(void)setUpClickDefault {
    [self setUpClickColor:kBackgroundGrayDefautColor];
}

@end
