//
//  BGMenuVCScrollerView.m
//  BGMenuVCScrollerView
//
//  Created by 黄雄彪 on 2017/6/9.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGMenuVCScrollerView.h"
#import "BGMenuFatherVC.h"

@implementation BGMenuVCScrollerViewItem
+(BGMenuVCScrollerViewItem *)itemWithTitle:(NSString *)title viewControllerName:(NSString *)viewControllerName
{
    BGMenuVCScrollerViewItem *item = [[BGMenuVCScrollerViewItem alloc]init];
    item.title = title;
    item.viewControllerName = viewControllerName;
    return item;
}
@end

@interface BGMenuVCScrollerView ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *viewVCScrollerView;//滑动的控制器
@property(nonatomic,strong)UIScrollView *itemScrollerView;//滑动的菜单栏
//  控制器菜单名数组实体
@property(nonatomic,strong)NSArray <BGMenuVCScrollerViewItem *>*items;
@property(nonatomic,strong)NSMutableArray *itemButtons;//菜单按钮
@property(nonatomic,strong)UIView *selectLineView;//选中的横线
@property(nonatomic,weak) UIViewController *viewController;//跳转的控制器
@end

@implementation BGMenuVCScrollerView

+(BGMenuVCScrollerView *)viewWithItems:(NSArray<BGMenuVCScrollerViewItem *> *)items viewController:(UIViewController*)viewController
{
    BGMenuVCScrollerView *view = [[BGMenuVCScrollerView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    view.viewController = viewController;
    view.items = items;
    view.selectIndex = 0;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _selectIndex = 1;
        _itemButtons = [NSMutableArray array];
        _itemVcs = [NSMutableArray array];
        self.backgroundColor = SHColor(245, 245, 245);
        _itemScrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
//        _itemScrollerView.backgroundColor = [UIColor redColor];
        _viewVCScrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0+44, kScreenWidth, kScreenHeight - 64-50-49)];
        _viewVCScrollerView.delegate = self;
        _viewVCScrollerView.scrollEnabled = YES;
        _viewVCScrollerView.pagingEnabled = YES;
        _viewVCScrollerView.bounces = NO;
        _itemScrollerView.bounces = NO;
        _itemScrollerView.showsHorizontalScrollIndicator = NO;
        _viewVCScrollerView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_itemScrollerView];
        [self addSubview:_viewVCScrollerView];
    }
    return self;
}

//  设置按钮及菜单栏
-(void)setItems:(NSArray *)items
{
    _items = items;
    _viewVCScrollerView.contentSize = CGSizeMake(kScreenWidth*items.count, _viewVCScrollerView.height);
    for (NSInteger i = 0; i < items.count; i++) {
        BGMenuVCScrollerViewItem *item = items[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = 150+i;
        btn.frame = CGRectMake(i*kScreenWidth/items.count, 0, kScreenWidth/items.count, 44);
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setTitleColor:_selectColor?_selectColor:kNavBarMainColor forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_itemScrollerView addSubview:btn];
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, btn.height-1, btn.width, 1)];
        lineView.backgroundColor = kLineMainColor;
        [btn addSubview:lineView];
        [btn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_itemButtons addObject:btn];
        if (NSClassFromString(item.viewControllerName)) {
            BGMenuFatherVC *vc = [[NSClassFromString(item.viewControllerName) alloc]init];
            vc.indexPage = (int)i+1;
            vc.view.frame = CGRectMake(i*kScreenWidth, 0, kScreenWidth, _viewVCScrollerView.height);
            vc.tableView.height = self.viewHight?self.viewHight:kScreenHeight-64-44;
            vc.viewController = self.viewController;
            [_itemVcs addObject:vc];
            [_viewVCScrollerView addSubview:vc.view];
        }
        
    }
    CGFloat lineWidth = (kScreenWidth/items.count>100)?100:kScreenWidth/items.count;
    _selectLineView = [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth/items.count/2-30, 42, lineWidth, 2)];
    _selectLineView.backgroundColor = _selectColor?_selectColor:kNavBarMainColor;
    [_itemScrollerView addSubview:_selectLineView];
}

//  选中或滑动到第几菜单，进行相应的界面变化数据加载
-(void)setSelectIndex:(int)selectIndex
{
    if (_selectIndex==selectIndex) {
        return;
    }
    _selectIndex = selectIndex;
    for (NSInteger i = 0; i < _itemButtons.count; i++) {
        UIButton *btn = _itemButtons[i];
        btn.selected = NO;
        if (i==selectIndex) {
            btn.selected = YES;
            _selectLineView.centerX = btn.centerX;
            //            _selectLineView.width = btn.width;
            [_viewVCScrollerView setContentOffset:CGPointMake(kScreenWidth*_selectIndex, 0) animated:YES];
        }
    }
    BGMenuFatherVC *vc = _itemVcs[selectIndex];
    if (_awaysLoadData) {//总是加载数据
        [vc.dataArr removeAllObjects];
        [vc.tableView reloadData];
        vc.page = 1;
        [vc updateData];
    }else {
        //滑动的时候没有数据才加载
        if (!vc.dataArr.count) {
            vc.page = 1;
            [vc updateData];
        }
    }
}

//  点击按钮的时候加载界面
-(void)selectBtn:(UIButton*)btn
{
    self.selectIndex = (int)btn.tag - 150;
}

// 设置选中的颜色
-(void)setSelectColor:(UIColor *)selectColor {
    _selectColor = selectColor;
    _selectLineView.backgroundColor = _selectColor;
    for (NSInteger i = 0; i < _itemButtons.count; i++) {
        UIButton *btn = _itemButtons[i];
        [btn setTitleColor:selectColor forState:UIControlStateSelected];
    }
}

-(void)setOriginY:(CGFloat)originY {
    _originY = originY;
    _itemScrollerView.y = originY;
    _viewVCScrollerView.y = originY+44;
}

//  设置高度
-(void)setViewHight:(CGFloat)viewHight
{
    _viewHight = viewHight;
    _viewVCScrollerView.height = viewHight - 44;
}

#pragma mark-------UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView==_viewVCScrollerView) {
        self.selectIndex = (int)(scrollView.contentOffset.x / kScreenWidth+0.5);
    }
}

@end
