//
//  HXBTabbarControlle.m
//  LoveE
//
//  Created by 黄雄彪 on 16/4/14.
//  Copyright © 2016年 huangxiongbiao. All rights reserved.
//

#import "HXBTabbarControlle.h"
#import "HXBNavigationController.h"
#import "HWTabBar.h"
#import "ViewController.h"


@interface HXBTabbarControlle ()

@property(nonatomic,strong)HXBNavigationController *managerNaviVC;

@end

@implementation HXBTabbarControlle

-(UIStatusBarStyle)preferredStatusBarStyle
{
    self.view.backgroundColor = kBackgroundGrayDefautColor;
    return UIStatusBarStyleLightContent;  //默认的值是黑色的
}

+(void)initialize
{
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kNavBarMainColor,NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:SHColor(109, 109, 109),NSFontAttributeName:[UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
    
    UITabBar *bar = [UITabBar appearance];
    bar.barTintColor = [UIColor whiteColor];
    
//    HWTabBar *bar = [HWTabBar appearance];
//    bar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *home = [ViewController new];
    [self addChildVc:home title:@"demoView展示" imageName:@"tab_sy" selectImageName:@"tab_sy_pre"];
//    ShareMainVC *service = [ShareMainVC new];
    UIViewController *service = [UIViewController new];
    [self addChildVc:service title:@"宁巢之家" imageName:@"tab_nczj" selectImageName:@"tab_nczj_pre"];
    UIViewController *manager = [UIViewController new];
    [self addChildVc:manager title:@"开门" imageName:@"tab_km" selectImageName:@"tab_km_pre"];
    UIViewController *order = [UIViewController new];
    [self addChildVc:order title:@"管家服务" imageName:@"tab_gjfw" selectImageName:@"tab_gjfw_pre"];
    UIViewController *mine = [UIViewController new];
    [self addChildVc:mine title:@"我的" imageName:@"tab_wd" selectImageName:@"tab_wd_pre"];
    
//    self.selectedIndex = 2;
//    manager.status = 1;
    
    // 2.更换系统自带的tabbar
//    HWTabBar *tabBar = [[HWTabBar alloc] init];
//    [self setValue:tabBar forKeyPath:@"tabBar"];
}


-(void)addChildVc:(UIViewController*)childVC title:(NSString*)title imageName:(NSString*)imageName selectImageName:(NSString*)selectImageName
{
    childVC.title = title;
    childVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    HXBNavigationController *nav = [[HXBNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

#pragma mark - HWTabBarDelegate代理方法
- (void)tabBarDidClickPlusButton:(HWTabBar *)tabBar
{
//    HotelManagerShareVC *manager = [HotelManagerShareVC shareHotelManagerVC];
//    if (!_managerNaviVC) {
//        _managerNaviVC = [[HXBNavigationController alloc] initWithRootViewController:manager];
//    }
//    [self presentViewController:_managerNaviVC animated:YES completion:nil];
}


@end
