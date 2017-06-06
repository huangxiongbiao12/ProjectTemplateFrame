//
//  PosterView.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/4/27.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,PosterViewPageType) {
    PosterViewPageTypePageCtl,
    PosterViewPageTypeLabel,
    PosterViewPageTypeDetail
};

@interface PosterView : UIView

//page的位置
@property(nonatomic,assign)CGRect pageFrame;
//页面指示类型
@property(nonatomic,assign)PosterViewPageType pageType;//默认ctl
//是否轮播
@property(nonatomic,assign)BOOL isLoop;//默认轮播
@property(nonatomic,assign)CGFloat timeLoop;//轮播间隔,默认3秒

//图片,最后设置，先设置基础属性
@property(nonatomic,strong)NSArray <NSString*>*itemArr;//图片链接
@property(nonatomic,strong)NSArray <NSString*>*desItems;//图片描述


@end
