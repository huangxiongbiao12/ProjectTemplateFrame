//
//  UIView+BG_Tool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BG_Tool)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
/**
 *  x方向最大值(控件不超出右侧边界为前提)
 */
@property(assign, nonatomic) CGFloat maxX;
/**
 *  y方向最大值（控件不超出下编辑为前提）
 */
@property(assign, nonatomic) CGFloat maxY;
//  截屏
- (UIImage *)captureScreen;

/**
 *  给View增加边框
 *  @param  radius 变的角度
 *  @param  width  线条宽度
 *  @param  color  线条颜色
 */
- (void)drawBoderWidth:(CGFloat)width andColor:(UIColor *)color andRadius:(CGFloat)radius;
@end
