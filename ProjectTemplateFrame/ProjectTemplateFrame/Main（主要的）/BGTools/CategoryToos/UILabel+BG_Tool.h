//
//  UILabel+BG_Tool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BG_Tool)

//在需要使用复制功能的时候只需要写这样一行代码：
//xxxLabel.isCopyable = YES
@property (nonatomic,assign) BOOL isCopyable;
//根据标题适配高度
-(double)fitHeightForTitle;
-(double)fitWidthForTitle;

@end
