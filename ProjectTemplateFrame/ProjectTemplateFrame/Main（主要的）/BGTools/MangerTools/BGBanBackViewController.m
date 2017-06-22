//
//  BGBanBackViewController.m
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/6/22.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGBanBackViewController.h"

@interface BGBanBackViewController ()

@end

@implementation BGBanBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
 禁止当前页面左侧滑动返回 导致卡死
 */

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [super viewWillDisappear:animated];
}

@end
