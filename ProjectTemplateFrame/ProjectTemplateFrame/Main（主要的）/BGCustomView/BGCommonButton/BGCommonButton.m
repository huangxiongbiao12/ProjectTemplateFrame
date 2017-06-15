//
//  BGCommonButton.m
//  BGCommonButton
//
//  Created by 黄雄彪 on 2017/6/8.
//  Copyright © 2017年 huangxiongbiao. All rights reserved.
//

#import "BGCommonButton.h"

@implementation BGCommonButton

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        _topInterval = 8;
        _titleInterVal = 5;
        _bottomInterval = 8;
        _titleFont = 15;
    }
    return self;
}

#pragma mark===============调位置==================

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    //    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    return CGRectMake(0, self.currentImage.size.height+_titleInterVal+_topInterval, self.frame.size.width, _titleFont);
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    //     DDLog(@"%f",self.width-self.currentImage.size.width);
    return CGRectMake((self.frame.size.width-self.currentImage.size.width)/2, _topInterval, self.currentImage.size.width, self.currentImage.size.height);
}

#pragma mark===============设置内容==================



-(void)setTitle:(NSString*)title image:(NSString*)image hightImage:(NSString*)hightImage{
    
    [self setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    if (hightImage) {
        [self setImage:[UIImage imageNamed:hightImage] forState:UIControlStateHighlighted];
    }else {
        [self setBackgroundImage:[BGColorTool imageFromColor:kBackgroundGrayDefautColor] forState:UIControlStateHighlighted];
    }
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:kBlackMian1Color forState:UIControlStateNormal];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.height = self.currentImage.size.height + 20 +_topInterval + _bottomInterval +_titleInterVal;
    
}

#pragma mark-------设置基本属性
-(void)setTopInterval:(CGFloat)topInterval
{
    _topInterval = topInterval;
    self.height = self.currentImage.size.height + _titleFont +_topInterval + _bottomInterval +_titleInterVal;
}
-(void)setBottomInterval:(CGFloat)bottomInterval
{
    _bottomInterval = bottomInterval;
    self.height = self.currentImage.size.height + _titleFont +_topInterval + _bottomInterval +_titleInterVal;
}
-(void)setTitleInterVal:(CGFloat)titleInterVal
{
    _titleInterVal = titleInterVal;
    self.height = self.currentImage.size.height + _titleFont +_topInterval + _bottomInterval +_titleInterVal;
}
-(void)setTitleFont:(CGFloat )titleFont
{
    self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
}
-(void)setTitleColor:(UIColor *)titleColor
{
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

@end
