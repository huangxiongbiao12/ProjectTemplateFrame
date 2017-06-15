//
//  BGComonChoiceView.m
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGComonChoiceView.h"

@interface BGComonChoiceView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation BGComonChoiceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArr = [NSMutableArray array];
        [_dataArr addObjectsFromArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
    }
    return self;
}

-(UIView *)contentView {
    if (!_contentView) {
        
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight/2, kScreenWidth, kScreenHeight/2)];
        _contentView.backgroundColor = kWhite;
        _contentView.userInteractionEnabled = YES;
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = kFont(15);
        titleLabel.text = @"缴费周期";
        titleLabel.textColor = kBlackMainColor;
        [_contentView addSubview:titleLabel];
        [_contentView addSubview:[BGViewFactory createLineView:CGRectMake(0, 43, kScreenWidth, 0.5)]];
        
        _tableView = [BGViewFactory creatTableViewDelegate:self];
        _tableView.height = _contentView.height-44;
        _tableView.y = 44;
        [_contentView addSubview:_tableView];
        
    }
    return _contentView;
}

#pragma mark-------UITableViewDelegate,UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(popView:choiceParam:)]) {
        [self.delegate popView:self choiceParam:_dataArr[indexPath.row]];
    }
    [self dismss];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.textLabel.textColor = kBlackMainColor;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@天",_dataArr[indexPath.row]];
    return cell;
}


@end
