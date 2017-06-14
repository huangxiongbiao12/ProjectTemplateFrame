//
//  UIImageView+BG_Tool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/14.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (BG_Tool)

// bundle图片设置，多线程优化
-(void)setImageBundleImageName:(NSString*)imageName;
// Images.xcassets图片设置，多线程优化
- (void)setImageWithImageName:(NSString *)imageName;

@end
