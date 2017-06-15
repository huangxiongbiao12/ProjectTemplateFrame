//
//  BGLoopBannerViewVC.m
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGLoopBannerViewVC.h"
#import "BGLoopBannerView.h"
#import "DefineHeader.h"

@interface BGLoopBannerViewVC ()

@end

@implementation BGLoopBannerViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGFloat h = kAutoSizeY(170);
    BGLoopBannerView *post = [[BGLoopBannerView alloc] initWithFrame:CGRectMake(0, 70, kScreenWidth, h)];
    post.itemArr = @[@"img_ad_banner",@"2.jpeg",@"3.jpeg"];
    [self.view addSubview:post];
    
    BGLoopBannerView *post1 = [[BGLoopBannerView alloc] initWithFrame:CGRectMake(0, 80+h, kScreenWidth, h)];
    post1.itemArr = @[@"img_ad_banner",@"2.jpeg",@"3.jpeg"];
    post1.pageType = BGLoopBannerViewPageTypeLabel;
    [self.view addSubview:post1];
    
    BGLoopBannerView *post2 = [[BGLoopBannerView alloc] initWithFrame:CGRectMake(0, 90+h*2, kScreenWidth, h)];
    post2.itemArr = @[@"img_ad_banner",@"2.jpeg",@"3.jpeg"];
    post2.desItems = @[@"img_ad_banner",@"2.jpeg",@"3.jpeg"];
    post2.pageType = BGLoopBannerViewPageTypeDetail;
    [self.view addSubview:post2];
}


@end
