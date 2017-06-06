//
//  HWTabBar.m
//  黑马微博2期
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HWTabBar.h"
#import "HXBColor.h"
#import "TabbarButton.h"

@interface HWTabBar()
@property (nonatomic, weak) UIButton *plusBtn;
@end

@implementation HWTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.barTintColor = SHColor(41, 40, 46);
        // 添加一个按钮到tabbar中
        TabbarButton *plusBtn = [TabbarButton buttonWithTitle:@"知住" imageName:@"btn_icon_zz"];
        plusBtn.titleLabelCustom.textColor = SHColor(109, 109, 109);
        plusBtn.titleLabelCustom.font = [UIFont systemFontOfSize:11];
        plusBtn.intervalHeight.constant = 0;
        plusBtn.height = 49;
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
        //设置背景,去除tabbar的黑线
//        [self setShadowImage:[HXBColor imageFromColor:[UIColor clearColor]]];
//        [self setBackgroundImage:[HXBColor imageFromColor:[UIColor whiteColor]]];
        self.alpha = 1;
    }
    return self;
}
//通知方法
-(void)upDatePlusBtn
{
    self.plusBtn.selected = YES;
}

-(void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kNotificationKey object:nil];
}

/**
 *  加号按钮点击
 */
- (void)plusClick
{
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self.plusBtn];
    }
}

- (void)layoutSubviews
{
#warning [super layoutSubviews] 一定要调用
    [super layoutSubviews];
    // 1.设置加号按钮的位置
    self.plusBtn.centerX = self.width * 0.5;
    self.plusBtn.y = -2;
    // 2.设置其他tabbarButton的位置和尺寸
    CGFloat tabbarButtonW = self.width / 5;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *child in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([child isKindOfClass:class]) {
            // 设置宽度
            child.width = tabbarButtonW;
            // 设置x
            child.x = tabbarButtonIndex * tabbarButtonW;

            // 增加索引
            tabbarButtonIndex++;
            if (tabbarButtonIndex == 2) {
                tabbarButtonIndex++;
            }
        }
    }
}

-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
   BOOL result = [super pointInside:point withEvent:event];
    if (result) {
        return result;
    }
    if (self.plusBtn.x<point.x&&(self.plusBtn.x+self.plusBtn.width)>point.x&&self.plusBtn.y<point.y&&(self.plusBtn.y+self.plusBtn.height)>point.y ) {
        return YES;
    }
    
    return NO;
}

@end
