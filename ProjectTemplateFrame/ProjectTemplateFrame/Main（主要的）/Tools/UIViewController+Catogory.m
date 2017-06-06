//
//  UIViewController+Catogory.m
//  HotelManager
//
//  Created by 黄雄彪 on 16/9/21.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "UIViewController+Catogory.h"

@implementation UIViewController (Catogory)

-(UIStatusBarStyle)preferredStatusBarStyle
{
    self.view.backgroundColor = kBackgroundGrayDefautColor;
    return UIStatusBarStyleLightContent;  //默认的值是黑色的
}

@end
