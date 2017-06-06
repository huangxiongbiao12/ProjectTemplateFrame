//
//  ChoiceTimeView.m
//  NingApartment
//
//  Created by 黄雄彪 on 17/5/18.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "ChoiceTimeView.h"
#import "NSDate+Tools.h"

@interface ChoiceTimeView ()

@property(nonatomic,strong)UIDatePicker *daraPicker;

@end

@implementation ChoiceTimeView


-(void)sureAction:(UIButton*)btn {
    if ([self.delegate respondsToSelector:@selector(choiceParam:)]) {
        [self.delegate choiceParam:[NSDate stringHDSFromDate:_daraPicker.date]];
    }
    [self dismss];
}

-(UIView *)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-(216+44), kScreenWidth, 216+44)];
        _contentView.backgroundColor = White;
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = kFont(15);
        titleLabel.text = @"选择时间";
        titleLabel.textColor = kBlackMainColor;
        [_contentView addSubview:titleLabel];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"确定" forState:UIControlStateNormal];
        [btn setTitleColor:kNavBarMainColor forState:UIControlStateNormal];
        btn.titleLabel.font = kFont(15);
        btn.frame = CGRectMake(kScreenWidth-60, 0, 60, 44);
        [btn addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:btn];
        
        [_contentView addSubview:[UtilityViewFactory createLineView:CGRectMake(0, 43, kScreenWidth, 0.5)]];
        
        _daraPicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0, 44, kScreenWidth, _contentView.height-44)];
        _daraPicker.locale= [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
        _daraPicker.datePickerMode = UIDatePickerModeDateAndTime;
        _daraPicker.minimumDate= [NSDate date];//七天内可预约
        _daraPicker.maximumDate= [NSDate dateWithTimeInterval:6*24*60*60 sinceDate:[NSDate date]];
        [_contentView addSubview:_daraPicker];
    }
    return _contentView;
}

@end
