//
//  HXBAppIntroduceVC.m
//  ProjectFrame
//
//  Created by 黄雄彪 on 16/1/11.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "HXBAppIntroduceVC.h"
#import "HXBNavigationController.h"
#import "HXBTabbarControlle.h"
#import "LoginVC.h"
#import "RegisterVC.h"

#define HWNewfeatureCount 5

@interface HXBAppIntroduceVC ()<UIScrollViewDelegate>
{
    int _type;//0跳过－1登陆－2注册
}
@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, weak) UIScrollView *scrollView;

@end

@implementation HXBAppIntroduceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _type = 0;
    // 1.创建一个scrollView：显示所有的新特性图片
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 2.添加图片到scrollView中
    CGFloat scrollW = scrollView.width;
    CGFloat scrollH = scrollView.height;
    for (int i = 0; i<HWNewfeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.width = scrollW;
        imageView.height = scrollH;
        imageView.y = 0;
        imageView.x = i * scrollW;
        // 显示图片
        NSString *name = [NSString stringWithFormat:@"bg_login_img_%d", i + 1];
        imageView.image = [UIImage imageNamed:name];
        [scrollView addSubview:imageView];
        
        // 如果是最后一个imageView，就往里面添加其他内容
        if (i == HWNewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
//#warning 默认情况下，scrollView一创建出来，它里面可能就存在一些子控件了
//#warning 就算不主动添加子控件到scrollView中，scrollView内部还是可能会有一些子控件
    
    // 3.设置scrollView的其他属性
    // 如果想要某个方向上不能滚动，那么这个方向对应的尺寸数值传0即可
    scrollView.contentSize = CGSizeMake(HWNewfeatureCount * scrollW, 0);
    scrollView.bounces = NO; // 去除弹簧效果
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    
    // 4.添加pageControl：分页，展示目前看的是第几页
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = HWNewfeatureCount;
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = kButtonNomDefautColor;
    pageControl.pageIndicatorTintColor = SHColor(204, 204, 204);
    pageControl.centerX = scrollW * 0.5;
    pageControl.centerY = scrollH - 50;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    
    UIButton *jumpBtn = [[UIButton alloc] init];
    [jumpBtn setTitle:@"跳过 >" forState:UIControlStateNormal];
    [jumpBtn setTitleColor:kButtonNomDefautColor forState:UIControlStateNormal];
    jumpBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    jumpBtn.width = 60;
    jumpBtn.height = 30;
    jumpBtn.centerX = kScreenWidth-70;
    jumpBtn.centerY = pageControl.centerY;
    [jumpBtn addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jumpBtn];

    
    // UIPageControl就算没有设置尺寸，里面的内容还是照常显示的
    //    pageControl.width = 100;
    //    pageControl.height = 50;
    //    pageControl.userInteractionEnabled = NO;
    
    //    UITextField *text = [[UITextField alloc] init];
    //    text.frame = CGRectMake(10, 20, 100, 50);
    //    text.borderStyle = UITextBorderStyleRoundedRect;
    //    [self.view addSubview:text];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x / scrollView.width;
    // 四舍五入计算出页码
    self.pageControl.currentPage = (int)(page + 0.5);
    // 1.3四舍五入 1.3 + 0.5 = 1.8 强转为整数(int)1.8= 1
    // 1.5四舍五入 1.5 + 0.5 = 2.0 强转为整数(int)2.0= 2
    // 1.6四舍五入 1.6 + 0.5 = 2.1 强转为整数(int)2.1= 2
    // 0.7四舍五入 0.7 + 0.5 = 1.2 强转为整数(int)1.2= 1
}

/**
 *  初始化最后一个imageView
 *
 *  @param imageView 最后一个imageView
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    // 开启交互功能
    imageView.userInteractionEnabled = YES;
    
    // 1.分享给大家（checkbox）
    UIButton *shareBtn = [[UIButton alloc] init];
//    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
//    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"注册" forState:UIControlStateNormal];
    [shareBtn setTitleColor:kButtonNomDefautColor forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = (kScreenWidth-25-20)/2;
    shareBtn.height = 45;
    shareBtn.x = 12.5;
    shareBtn.y = kScreenHeight-85-50;
    [shareBtn addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    shareBtn.clipsToBounds = YES;
    shareBtn.layer.cornerRadius = 5;
    shareBtn.layer.borderWidth = 1;
    shareBtn.layer.borderColor = kButtonNomDefautColor.CGColor;
    
    //    shareBtn.backgroundColor = [UIColor redColor];
    //    shareBtn.imageView.backgroundColor = [UIColor blueColor];
    //    shareBtn.titleLabel.backgroundColor = [UIColor yellowColor];
    // top left bottom right
    // EdgeInsets: 自切
    // contentEdgeInsets:会影响按钮内部的所有内容（里面的imageView和titleLabel）
    //    shareBtn.contentEdgeInsets = UIEdgeInsetsMake(10, 100, 0, 0);
    // titleEdgeInsets:只影响按钮内部的titleLabel
//    shareBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    // imageEdgeInsets:只影响按钮内部的imageView
    //    shareBtn.imageEdgeInsets = UIEdgeInsetsMake(20, 0, 0, 50);
    
    
    // 2.开始微博
    UIButton *startBtn = [[UIButton alloc] init];
//    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
//    [startBtn setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
//    startBtn.size = startBtn.currentBackgroundImage.size;
//    startBtn.frame = CGRectMake(0, 0, 100, 100);
    startBtn.width = (kScreenWidth-25-20)/2;
    startBtn.height = 45;
    startBtn.x = kScreenWidth/2+10;
    startBtn.y = kScreenHeight-85-50;
    [startBtn setTitle:@"登录" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];
    startBtn.clipsToBounds = YES;
    startBtn.layer.cornerRadius = 5;
    startBtn.backgroundColor = kButtonNomDefautColor;
    [startBtn setBackgroundImage:[BGColorTool imageFromColor:kButtonHeiDefautColor] forState:UIControlStateHighlighted];
}

- (void)shareClick:(UIButton *)shareBtn
{
    // 状态取反
    shareBtn.selected = !shareBtn.isSelected;
}

- (void)startClick:(UIButton*)btn
{
    // 切换到HWTabBarController
    /*
     切换控制器的手段
     1.push：依赖于UINavigationController，控制器的切换是可逆的，比如A切换到B，B又可以回到A
     2.modal：控制器的切换是可逆的，比如A切换到B，B又可以回到A
     3.切换window的rootViewController
     */
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    引导页设置rootViewController
    //没有登录过，显示登录界面
    HXBTabbarControlle *main = [[HXBTabbarControlle alloc] init];
    window.rootViewController = main;
    
    // modal方式，不建议采取：新特性控制器不会销毁
    //    HWTabBarViewController *main = [[HWTabBarViewController alloc] init];
    //    [self presentViewController:main animated:YES completion:nil];
    
    if ([btn.titleLabel.text isEqualToString:@"登录"]) {
        main.selectedIndex = 4;
        LoginVC *vc = [LoginVC new];
        [(HXBNavigationController*)main.viewControllers[4] pushViewController:vc animated:NO];
    }else if ([btn.titleLabel.text isEqualToString:@"注册"]){
        main.selectedIndex = 4;
        RegisterVC *vc = [RegisterVC new];
         [(HXBNavigationController*)main.viewControllers[4] pushViewController:vc animated:NO];
    }
}

- (void)dealloc
{
    DDLog(@"HWNewfeatureViewController-dealloc");
}

/*
 1.程序启动会自动加载叫做Default的图片
 1> 3.5inch 非retain屏幕：Default.png
 2> 3.5inch retina屏幕：Default@2x.png
 3> 4.0inch retain屏幕: Default-568h@2x.png
 
 2.只有程序启动时自动去加载的图片, 才会自动在4inch retina时查找-568h@2x.png
 */

/*
 一个控件用肉眼看不见，有哪些可能
 1.根本没有创建实例化这个控件
 2.没有设置尺寸
 3.控件的颜色跟父控件的背景色一样（实际上已经显示了，只不过用肉眼看不见）
 4.透明度alpha <= 0.01
 5.hidden = YES
 6.没有添加到父控件中
 7.被其他控件挡住了
 8.位置不对
 9.父控件发生了以上情况
 10.特殊情况
 * UIImageView没有设置image属性，或者设置的图片名不对
 * UILabel没有设置文字，或者文字颜色和跟父控件的背景色一样
 * UITextField没有设置文字，或者没有设置边框样式borderStyle
 * UIPageControl没有设置总页数，不会显示小圆点
 * UIButton内部imageView和titleLabel的frame被篡改了，或者imageView和titleLabel没有内容
 * .....
 
 添加一个控件的建议（调试技巧）：
 1.最好设置背景色和尺寸
 2.控件的颜色尽量不要跟父控件的背景色一样
 */


@end
