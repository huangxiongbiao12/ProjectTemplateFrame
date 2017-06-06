//
//  ChoiceParamView.m
//  NingApartment
//
//  Created by 黄雄彪 on 17/5/18.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "ChoiceParamView.h"

@interface ChoiceParamView ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArr;

@end

@implementation ChoiceParamView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArr = [NSMutableArray array];
        [_dataArr addObjectsFromArray:@[@"1个月",@"3个月",@"6个月",@"12个月",@"18个月",@"24个月"]];
    }
    return self;
}

-(UIView *)contentView {
    if (!_contentView) {
        
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight/2, kScreenWidth, kScreenHeight/2)];
        _contentView.backgroundColor = White;
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = kFont(15);
        titleLabel.text = @"缴费周期";
        titleLabel.textColor = kBlackMainColor;
        [_contentView addSubview:titleLabel];
        [_contentView addSubview:[UtilityViewFactory createLineView:CGRectMake(0, 43, kScreenWidth, 0.5)]];
        
        _tableView = [UtilityViewFactory creatTableViewDelegate:self];
        _tableView.height = _contentView.height-44;
        _tableView.y = 44;
        [_contentView addSubview:_tableView];
        
    }
    return _contentView;
}

#pragma mark-------UITableViewDelegate,UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([self.delegate respondsToSelector:@selector(choiceParam:)]) {
        [self.delegate choiceParam:_dataArr[indexPath.row]];
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
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}


@end
