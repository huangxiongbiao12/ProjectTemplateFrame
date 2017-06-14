//
//  HXBNavigationController.m
//  LoveE
//
//  Created by 黄雄彪 on 16/4/14.
//  Copyright © 2016年 huangxiongbiao. All rights reserved.
//

#import "HXBNavigationController.h"
#import "BGColorTool.h"

@interface HXBNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation HXBNavigationController

-(UIStatusBarStyle)preferredStatusBarStyle
{
    self.view.backgroundColor = kBackgroundGrayDefautColor;
    return UIStatusBarStyleLightContent;  //默认的值是黑色的
}

+(void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    bar.barTintColor = kNavBarMainColor;
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
    
    [bar setBackgroundImage:[BGColorTool imageFromColor:kNavBarMainColor] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    viewController.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationBar.translucent = NO;
    viewController.extendedLayoutIncludesOpaqueBars = YES;
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"icon_fh" highImage:@"icon_fh"];
    }
    [super pushViewController:viewController animated:animated];
     viewController.navigationController.interactivePopGestureRecognizer.delegate = self;
     viewController.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

//-(UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    UIViewController *vc = [super popViewControllerAnimated:animated];
//    if ([self.viewControllers[self.viewControllers.count-1] isKindOfClass:[HomeVC class]]||[self.viewControllers[self.viewControllers.count-1] isKindOfClass:[MineVC class]]||[self.viewControllers[self.viewControllers.count-1] isKindOfClass:[HotelManagerShareVC class]]){
//        self.navigationBarHidden = YES;
//    }
//    return vc;
//}

-(void)back{
    [self popViewControllerAnimated:YES];
}

@end
