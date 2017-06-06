//
//  TabbarButton.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/4/29.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "TabbarButton.h"

@interface TabbarButton ()

@end

@implementation TabbarButton


+(TabbarButton *)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    TabbarButton *tabBtn = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    tabBtn.backgroundColor = [UIColor clearColor];
    tabBtn.image = [UIImage imageNamed:imageName];
    tabBtn.title = title;
    tabBtn.height = tabBtn.imageViewCustom.image.size.height + 10 + 20 + 5;
    tabBtn.imageHeight.constant = tabBtn.imageViewCustom.image.size.height;
    tabBtn.imageWidth.constant = tabBtn.imageViewCustom.image.size.width;
    [tabBtn setBackgroundImage:[UIImage imageNamed:@"btn_bg_gray"] forState:UIControlStateHighlighted];
    return tabBtn;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    self.titleLabelCustom.text = title;
}
-(void)setImage:(UIImage *)image
{
    _image = image;
    self.imageViewCustom.image = image;
}

@end
