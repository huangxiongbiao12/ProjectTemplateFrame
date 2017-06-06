//
//  HXBPOPRootView.m
//  NingApartment
//
//  Created by 黄雄彪 on 17/5/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "HXBPOPRootView.h"

@implementation HXBPOPRootView

+(HXBPOPRootView *)rootView {
    
    HXBPOPRootView *rootView = [[self alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [rootView addSubview:rootView.contentView];
    rootView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:rootView action:@selector(dismss)];
    [rootView addGestureRecognizer:tap];
    return rootView;

}

-(void)updateOrInitContentView:(id)data {
    
}

-(void)show {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
}

-(void)dismss {
    [self removeFromSuperview];
}

@end
