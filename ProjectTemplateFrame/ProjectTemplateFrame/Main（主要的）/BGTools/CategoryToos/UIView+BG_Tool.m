//
//  UIView+BG_Tool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UIView+BG_Tool.h"

@implementation UIView (BG_Tool)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}
- (void)setMaxX:(CGFloat)maxX {
    self.x = maxX - self.width;
}
- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}
- (void)setMaxY:(CGFloat)maxY {
    self.y = maxY - self.height;
}
#pragma mark 截屏
- (UIImage *)captureScreen {
    //1.开启一个图像上下文
    UIGraphicsBeginImageContext(self.bounds.size);
    //2.渲染当前控件图层内容到上下文
    //取得当前上下文，注意此时获得的不是窗口上下文而是图像上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //渲染图层到上下文
    [self.layer renderInContext:context];
    //3.从当前上下方获得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //4.关闭图像上下文
    UIGraphicsEndImageContext();
    return image;
}

-(void)drawBoderWidth:(CGFloat)width andColor:(UIColor *)color andRadius:(CGFloat)radius {
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius]; //设置矩圆角半径
    [self.layer setBorderWidth:width];   //边框宽度
    [self.layer setBorderColor:color.CGColor];//边框颜色
}

@end
