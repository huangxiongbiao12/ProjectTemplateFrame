//
//  HXBLoadingHUD.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/6/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXBLoadingHUD : UIView

@property(nonatomic,strong)UILabel *infolabel;//加载标签
@property(nonatomic,strong)UIView *bgView;//透明背景
+(HXBLoadingHUD *)showMessage:(NSString *)message toView:(UIView *)view withGifFilePath:(NSString*)filePath;
+ (HXBLoadingHUD *)showMessage:(NSString*)message toView:(UIView *)view;
+ (void)hideHUDForView:(UIView *)view;

+(HXBLoadingHUD *)showCommonMessage:(NSString *)message toView:(UIView *)view;
+(void)hideCommonHUDForView:(UIView *)view;
-(void)showSuccessWithIcon:(NSString*)icon;

@end
