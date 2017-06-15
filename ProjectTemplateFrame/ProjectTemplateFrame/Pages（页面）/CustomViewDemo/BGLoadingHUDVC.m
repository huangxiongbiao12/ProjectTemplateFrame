//
//  BGLoadingHUDVC.m
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGLoadingHUDVC.h"
#import "BGLoadingHUD.h"

@interface BGLoadingHUDVC ()

@end

@implementation BGLoadingHUDVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *gifBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gifBtn.frame = CGRectMake(40, 100, 100, 40);
    [gifBtn setTitle:@"gif加载" forState:UIControlStateNormal];
    gifBtn.backgroundColor = [UIColor redColor];
    [gifBtn addTarget:self action:@selector(gifAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gifBtn];
    
    UIButton *gifBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    gifBtn1.frame = CGRectMake(40, 160, 100, 40);
    [gifBtn1 setTitle:@"gif加载1" forState:UIControlStateNormal];
    gifBtn1.backgroundColor = [UIColor redColor];
    [gifBtn1 addTarget:self action:@selector(gif1Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gifBtn1];
    
    UIButton *gifBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    gifBtn2.frame = CGRectMake(40, 220, 100, 40);
    [gifBtn2 setTitle:@"gif加载2" forState:UIControlStateNormal];
    gifBtn2.backgroundColor = [UIColor redColor];
    [gifBtn2 addTarget:self action:@selector(gif2Action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gifBtn2];
    
    UIButton *actBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    actBtn.frame = CGRectMake(40, 280, 100, 40);
    [actBtn setTitle:@"菊花加载" forState:UIControlStateNormal];
    actBtn.backgroundColor = [UIColor redColor];
    [actBtn addTarget:self action:@selector(actAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:actBtn];
}

//  gif加载
-(void)gifAction {
    [BGLoadingHUD showMessage:@"gif加载" toView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [BGLoadingHUD hideHUDForView:self.view];
    });
}

//  gif1加载
-(void)gif1Action {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"qudian" ofType:@"gif"];
    [BGLoadingHUD showMessage:@"gif1加载" toView:self.view withGifFilePath:path];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [BGLoadingHUD hideHUDForView:self.view];
    });
}

//  gif2加载
-(void)gif2Action {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"kaimen1" ofType:@"gif"];
    [BGLoadingHUD showMessage:@"gif2加载" toView:self.view withGifFilePath:path];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [BGLoadingHUD hideHUDForView:self.view];
    });
}

//菊花加载
-(void)actAction {
    [BGLoadingHUD showCommonMessage:@"菊花加载" toView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [BGLoadingHUD hideCommonHUDForView:self.view];
    });
}
@end
