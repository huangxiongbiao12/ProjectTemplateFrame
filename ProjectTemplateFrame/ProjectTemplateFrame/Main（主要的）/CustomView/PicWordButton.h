//
//  PicWordButton.h
//  PrecisionLock
//
//  Created by 黄雄彪 on 15/12/9.
//  Copyright © 2015年 马强. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicWordButton : UIButton

@property(nonatomic,assign)CGFloat topInterval;//图片距离上边距离  默认8
@property(nonatomic,assign)CGFloat titleInterVal;//图片距离title距离  默认5
@property(nonatomic,assign)CGFloat bottomInterval;//title距离下边距离  默认8

@property(nonatomic,weak)UIColor *titleColor;//默认白色，调节标题颜色
@property(nonatomic,weak)UIFont *titleFont;//标题大小，默认15

-(void)setTitle:(NSString*)title image:(NSString*)image hightImage:(NSString*)hightImage;

@end
