//
//  UIViewController+BG_Tool.h
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/6/20.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (BG_Tool)

@property (copy, nonatomic) NSString *navBarOrigTitle;
@property (assign, nonatomic) BOOL isLoading;

- (void)startLoading;
- (void)stopLoading;


@end
