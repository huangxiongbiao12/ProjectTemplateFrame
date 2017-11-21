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
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self];
    if (CGRectContainsPoint(self.contentView.frame,point)) {
        return;
    }
    [self dismss];
}

-(void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
}

-(void)dismss {
    [self removeFromSuperview];
}

@end
