//
//  BGMenuScrollerVC.m
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGMenuScrollerVC.h"
#import "BGMenuVCScrollerView.h"
#import "PostFatherVC.h"

@interface BGMenuScrollerVC ()

@end

@implementation BGMenuScrollerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
#warning 注意控制器要继承BGMenuFatherVC
    BGMenuVCScrollerViewItem *all = [BGMenuVCScrollerViewItem itemWithTitle:@"全部" viewControllerName:@"PostFatherVC"];
    BGMenuVCScrollerViewItem *community = [BGMenuVCScrollerViewItem itemWithTitle:@"社区活动" viewControllerName:@"PostFatherVC"];
    BGMenuVCScrollerViewItem *common = [BGMenuVCScrollerViewItem itemWithTitle:@"帖子" viewControllerName:@"PostFatherVC"];
    BGMenuVCScrollerViewItem *second = [BGMenuVCScrollerViewItem itemWithTitle:@"二手" viewControllerName:@"PostFatherVC"];
    BGMenuVCScrollerViewItem *help = [BGMenuVCScrollerViewItem itemWithTitle:@"求助" viewControllerName:@"PostFatherVC"];
    //设置标题和菜单栏
    BGMenuVCScrollerView *view = [BGMenuVCScrollerView viewWithItems:@[all,community,common,second,help] viewController:self];
    view.viewHight = kScreenHeight-64;//设置高度
    view.originY = 64;//设置位置
    view.selectColor = [UIColor redColor];//设置选中的颜色
    self.view  = view;
}

@end
