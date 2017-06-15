//
//  BGCommonButton.h
//  BGCommonButton
//
//  Created by 黄雄彪 on 2017/6/8.
//  Copyright © 2017年 huangxiongbiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGCommonButton : UIButton

//按钮的高度时根据间距及图片大小字体大小计算的，与设置的高度无关

@property(nonatomic,assign)CGFloat topInterval;//图片距离上边距离  默认8
@property(nonatomic,assign)CGFloat titleInterVal;//图片距离title距离  默认5
@property(nonatomic,assign)CGFloat bottomInterval;//title距离下边距离  默认8

@property(nonatomic,weak)UIColor *titleColor;//默认白色，调节标题颜色
@property(nonatomic,assign)CGFloat titleFont;//标题大小，默认15

//设置标题及图片
-(void)setTitle:(NSString*)title image:(NSString*)image hightImage:(NSString*)hightImage;
@end
