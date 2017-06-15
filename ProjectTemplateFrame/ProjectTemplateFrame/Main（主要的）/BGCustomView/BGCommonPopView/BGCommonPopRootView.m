//
//  BGCommonPopRootView.m
//  NingApartment
//
//  Created by 黄雄彪 on 17/5/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGCommonPopRootView.h"

@implementation BGCommonPopRootView

+(BGCommonPopRootView *)rootView {
    
    BGCommonPopRootView *rootView = [[self alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [rootView addSubview:rootView.contentView];
    rootView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    return rootView;

}

-(void)updateOrInitContentView:(id)data {
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismss];
}

-(void)show {
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
}

-(void)dismss {
    [self removeFromSuperview];
}

@end
