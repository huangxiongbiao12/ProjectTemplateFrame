//
//  DoubleTitleButton.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/31.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "DoubleTitleButton.h"

@interface DoubleTitleButton ()


@end

@implementation DoubleTitleButton

+(DoubleTitleButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title subTitle:(NSString *)subTitle
{
    DoubleTitleButton *btn = [DoubleTitleButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.mainTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height/2, frame.size.width, frame.size.height/2)];
    btn.mainTitleLabel.textAlignment = NSTextAlignmentCenter;
    btn.mainTitleLabel.textColor = kTitleGrayColor;
    btn.mainTitleLabel.font = [UIFont systemFontOfSize:12];
    [btn addSubview:btn.mainTitleLabel];
    btn.subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, frame.size.height/2-10)];
    btn.subTitleLabel.textAlignment = NSTextAlignmentCenter;
    btn.subTitleLabel.textColor = kBlackMainColor1;
    btn.subTitleLabel.font = [UIFont systemFontOfSize:15];
    [btn addSubview:btn.subTitleLabel];
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 1)];
    lineView.backgroundColor = kLineMainColor;
    [btn addSubview:lineView];
    btn.title = title;
    btn.subTitle = subTitle;
    return btn;
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _mainTitleLabel.text = title;
}
-(void)setSubTitle:(NSString *)subTitle
{
    _subTitle = subTitle;
    _subTitleLabel.text = subTitle;
}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        _subTitleLabel.textColor = kNavBarMainColor;
        _mainTitleLabel.textColor = kNavBarMainColor;
    }else{
        _subTitleLabel.textColor = kBlackMainColor;
        _mainTitleLabel.textColor = kBlackMainColor;
    }
}


@end
