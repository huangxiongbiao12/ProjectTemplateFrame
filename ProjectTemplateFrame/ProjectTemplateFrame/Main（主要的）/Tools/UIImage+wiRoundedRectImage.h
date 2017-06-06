//
//  UIImage+wiRoundedRectImage.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/10/8.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (wiRoundedRectImage)
+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(NSInteger)r;
@end
