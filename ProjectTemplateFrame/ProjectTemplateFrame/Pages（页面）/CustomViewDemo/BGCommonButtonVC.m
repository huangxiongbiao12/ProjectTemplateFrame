//
//  BGCommonButtonVC.m
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGCommonButtonVC.h"
#import "BGCommonButton.h"
#import "UIView+BG_Tool.h"
#import "DefineHeader.h"

@interface BGCommonButtonVC ()

@end

@implementation BGCommonButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *titles = @[@"摇一摇",@"信息",@"更多",@"帮助"];
    NSArray *images = @[@"handShake",@"IDInfo",@"MoreAbout",@"MoreHelp"];
    //按钮的高度时根据间距及图片大小字体大小计算的，与设置的高度无关
    for (int i = 0; i < titles.count; i++) {
        BGCommonButton *btn = [BGCommonButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = kBackgroundGrayDefautColor;
        btn.x = i*kScreenWidth/4;
        btn.width = kScreenWidth/4;
        btn.y = 100;
        [btn setTitle:titles[i] image:images[i] hightImage:images[i]];
        [self.view addSubview:btn];
    }
    
    for (int i = 0; i < titles.count; i++) {
        BGCommonButton *btn = [BGCommonButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = kBackgroundGrayDefautColor;
        btn.x = i*kScreenWidth/4;
        btn.width = kScreenWidth/4;
        btn.y = 180;
        [btn setTitle:titles[i] image:images[i] hightImage:images[i]];
        [self.view addSubview:btn];
        btn.titleFont = 15;//设置字体大小
        btn.titleColor = kBlackMainColor1;//设置颜色
    }
    
    for (int i = 0; i < titles.count; i++) {
        BGCommonButton *btn = [BGCommonButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = kBackgroundGrayDefautColor;
        btn.x = i*kScreenWidth/4;
        btn.width = kScreenWidth/4;
        btn.y = 260;
        [btn setTitle:titles[i] image:images[i] hightImage:images[i]];
        [self.view addSubview:btn];
        
        btn.titleFont = 15;//设置字体大小
        btn.titleColor = [UIColor redColor];//设置颜色
        btn.topInterval = 10;//设置顶部距离
        btn.titleInterVal = 12;//设置中间距离
        btn.bottomInterval = 10;//设置底部距离
    }
}
@end
