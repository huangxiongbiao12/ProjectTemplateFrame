//
//  BGViewFactory.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGViewFactory.h"
#import "DefineHeader.h"
#import "BGColorTool.h"

@implementation BGViewFactory

#pragma mark-------创建tabelView

+(UITableView *)creatTableViewDelegate:(id)delegate {
    UITableView *tabelView = [self creatTableViewDelegate:delegate style:UITableViewStylePlain];
    return tabelView;
}

+(UITableView *)creatTableViewGroupDelegate:(id)delegate {
    UITableView *tabelView = [self creatTableViewDelegate:delegate style:UITableViewStyleGrouped];
    return tabelView;
}

+(UITableView *)creatTableViewDelegate:(id)delegate style:(UITableViewStyle)style {
    UITableView *tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:style];
    tabelView.delegate = delegate;
    tabelView.dataSource = delegate;
    tabelView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    return tabelView;
}

+(UIView*)creatTableFooterBtnTitle:title Target:(id)target action:(SEL)action {
    //尾部按钮点击输入框新增的时候才出现
    UIView *footer = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.frame = CGRectMake(10, 10, kScreenWidth-20, 44);
    [payBtn setTitle:title forState:UIControlStateNormal];
    [payBtn setBackgroundImage:[BGColorTool imageFromColor:kNavBarMainColor] forState:UIControlStateNormal];
    //    [payBtn setBackgroundImage:[HXBColor imageFromColor:kButtonDisDefautColor] forState:UIControlStateDisabled];
    payBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    payBtn.layer.cornerRadius = 20;
    payBtn.clipsToBounds = YES;
    [footer addSubview:payBtn];
    [payBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return footer;
}

+(UIView *)createLineView:(CGRect)frame {
    UIView *lineView = [[UIView alloc]initWithFrame:frame];
    lineView.backgroundColor = kLineMainColor;
    return lineView;
}


@end
