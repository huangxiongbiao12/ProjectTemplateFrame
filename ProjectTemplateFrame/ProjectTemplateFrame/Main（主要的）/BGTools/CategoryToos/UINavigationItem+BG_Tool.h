//
//  UINavigationItem+BG_Tool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationItem (BG_Tool)

//  调节按钮到边界的距离
- (void)setLeftBarButtonItem:(UIBarButtonItem *)_leftBarButtonItem;
- (void)setRightBarButtonItem:(UIBarButtonItem *)_rightBarButtonItem;

@end
