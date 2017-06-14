//
//  BGCheckLoginTool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BGCheckLoginTool : NSObject

// 返回yes为登录  no 没有登录
+(BOOL)checkLoginWithVC:(UIViewController*)viewController;

@end
