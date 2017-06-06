//
//  HXBPOPRootView.h
//  NingApartment
//
//  Created by 黄雄彪 on 17/5/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>


#define kContentW (kScreenWidth-30)

@protocol HXBPOPRootViewDelegate <NSObject>

-(void)choiceParam:(id)param;

@end


@interface HXBPOPRootView : UIView
{
    UIView *_contentView;
}
//展示的内容
@property(nonatomic,strong)UIView *contentView;
@property(nonatomic,weak) id<HXBPOPRootViewDelegate> delegate;
//  生成view
+(HXBPOPRootView*)rootView;

//  初始化或修改展示的内容
-(void)updateOrInitContentView:(id)data;

//  展示视图
-(void)show;

//  隐藏视图
-(void)dismss;

@end
