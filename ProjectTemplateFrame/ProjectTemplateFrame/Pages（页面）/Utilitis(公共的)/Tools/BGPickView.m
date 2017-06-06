//
//  BGPickView.m
//  HotelManager
//
//  Created by 黄雄彪 on 16/8/29.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGPickView.h"
#define ZHToobarHeight 40
@interface BGPickView ()<UITableViewDelegate,UITableViewDataSource>
{
    UITapGestureRecognizer *_tapRemove;//移除键盘手饰
    UIView *_gestureView;
}
@property(nonatomic,strong)UITableView *pickerView;
@property(nonatomic,assign)BOOL isHaveNavControler;
@property(nonatomic,assign)NSInteger pickeviewHeight;
@property(nonatomic,copy)NSString *resultString;
@end

@implementation BGPickView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _selectNum = 0;
        _pickerView.frame = self.bounds;
    }
    return self;
}

-(instancetype)initPickviewWithArray:(NSArray *)array selectString:(NSString*)selectString{
    self=[super init];
    if (self) {
        [self setUpPickView];
        self.dataArr=array;
        self.selectString = selectString;
    }
    return self;
}

-(void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _pickerView.frame = self.bounds;
}

-(void)setUpPickView{
    UITableView *pickView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight/3) style:UITableViewStylePlain];
    pickView.backgroundColor=[UIColor whiteColor];
    _pickerView=pickView;
    pickView.delegate=self;
    pickView.dataSource=self;
    _pickeviewHeight=pickView.frame.size.height;
    [self addSubview:pickView];
}

-(void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
    [_pickerView reloadData];
}

#pragma mark UITableViewDelegate,UITableViewDataSource 数据源方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    if ([_dataArr[indexPath.row] isEqualToString:_selectString]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.detailTextLabel.textColor = SHColor(0, 127, 255);
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.detailTextLabel.textColor = [UIColor blackColor];
    }
    cell.detailTextLabel.text = _dataArr[indexPath.row];
    return cell;
}
#pragma mark UITableViewDelegate,UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectString = _dataArr[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(pickClick:resultString:)]) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [_pickerView reloadData];
        _selectNum = indexPath.row;//选中第几个
        [self.delegate pickClick:self resultString:_selectString];
        [self remove];
    }
}



#pragma mark-------外部掉用方法
-(void)remove{
    if ([self.delegate respondsToSelector:@selector(pickCancelClick:)]) {
        [self.delegate pickCancelClick:self];
    }
    [_gestureView removeGestureRecognizer:_tapRemove];
    [_gestureView removeFromSuperview];
    [self removeFromSuperview];
}
-(void)show{
    [self showInView:nil];
}
-(void)showInView:(UIView*)view
{
    if (!_gestureView) {
        _gestureView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        _gestureView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        _tapRemove = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove)];
    }
    if (view==nil) view = [UIApplication sharedApplication].keyWindow;
    [view addSubview:_gestureView];
    [_gestureView addGestureRecognizer:_tapRemove];
    [view addSubview:self];
    for (int i = 0; i < _dataArr.count; i++) {
        if ([_dataArr[i] isEqualToString:_selectString]) {
            [_pickerView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:nil];
            return;
        }
    }
}
-(void)setShowY:(NSInteger)showY
{
    _gestureView.y = showY;
    self.y = showY;
}
-(void)setSelectString:(NSString *)selectString
{
    _selectString = selectString;
    [_pickerView reloadData];
}
/**
 *  设置PickView的颜色
 */
-(void)setPickViewColer:(UIColor *)color{
    _pickerView.backgroundColor=color;
}

@end
