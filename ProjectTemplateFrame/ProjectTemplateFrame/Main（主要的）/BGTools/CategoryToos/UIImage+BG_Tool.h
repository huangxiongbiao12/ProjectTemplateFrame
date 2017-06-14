//
//  UIImage+BG_Tool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BG_Tool)

// 给图片切圆角
+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;

// 加载图片 imageWithContentsOfFile  大图加载
+ imageBundleWithName:(NSString*)name;

@end
