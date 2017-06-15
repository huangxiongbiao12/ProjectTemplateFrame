//
//  BGPopDemoVC.m
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGPopDemoVC.h"
#import "BGChoiceTimeView.h"
#import "BGComonChoiceView.h"

@interface BGPopDemoVC ()<BGCommonPopRootViewDelegate>
{
    UIButton *_gifBtn;
    UIButton *_gifBtn1;
}
@property(nonatomic,strong)BGChoiceTimeView *choiceTimeView;
@property(nonatomic,strong)BGComonChoiceView *choiceParamView;
@end

@implementation BGPopDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *gifBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    gifBtn.frame = CGRectMake(40, 100, 250, 40);
    [gifBtn setTitle:@"选择参数" forState:UIControlStateNormal];
    gifBtn.backgroundColor = [UIColor redColor];
    [gifBtn addTarget:self action:@selector(pickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gifBtn];
    _gifBtn = gifBtn;
    
    UIButton *gifBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    gifBtn1.frame = CGRectMake(40, 160, 250, 40);
    [gifBtn1 setTitle:@"选择时间" forState:UIControlStateNormal];
    gifBtn1.backgroundColor = [UIColor redColor];
    [gifBtn1 addTarget:self action:@selector(pickTimeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:gifBtn1];
    _gifBtn1 = gifBtn1;
}

#pragma mark-------BGCommonPopRootViewDelegate

-(void)popView:(BGCommonPopRootView *)view choiceParam:(id)param {
    if (view==_choiceTimeView) {
        [_gifBtn1 setTitle:param forState:UIControlStateNormal];
    }else if (view==_choiceParamView) {
        [_gifBtn setTitle:param forState:UIControlStateNormal];
    }
}

#pragma mark-------

-(void)pickAction {
    [self.choiceParamView show];
}

-(void)pickTimeAction {
    [self.choiceTimeView show];
}

#pragma mark-------

-(BGComonChoiceView *)choiceParamView {
    if (!_choiceParamView) {
        _choiceParamView = (BGComonChoiceView*)[BGComonChoiceView rootView];
        _choiceParamView.delegate = self;
    }
    return _choiceParamView;
}

-(BGChoiceTimeView *)choiceTimeView {
    if (!_choiceTimeView) {
        _choiceTimeView = (BGChoiceTimeView*)[BGChoiceTimeView rootView];
        _choiceTimeView.delegate = self;
    }
    return _choiceTimeView;
}

@end
