//
//  FatherListVC.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/6/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "FatherListVC.h"

@interface FatherListVC ()
@property(nonatomic,strong)UIButton *bgButton;
@property(nonatomic,strong)UILabel *bgLabel;
@property(nonatomic,strong)UIView *bgHeaderView;
@end

@implementation FatherListVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataArr = [NSMutableArray array];
        self.page = 1;
        self.isSetRefresh = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kBackgroundGrayDefautColor;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
    self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
    //是否分页
    if (_isSetRefresh) {
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.page = 1;
            [self updateData];
        }];
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.page++;
            [self updateData];
        }];
//        self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//            self.page++;
//            [self updateData];
//        }];
    }
    [self.tableView reloadData];
}
#pragma mark-------似有方法

-(void)setBackgroundImageName:(NSString *)imageName tips:(NSString *)tips
{
    [self addKVOForVC];
    self.bgLabel.text = tips;
    [self.bgButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    _bgButton.frame = CGRectMake(kScreenWidth/2-_bgButton.currentImage.size.width/2,self.tableView.height/2-_bgButton.currentImage.size.height/2-15-(kScreenHeight-self.tableView.height)/2, _bgButton.currentImage.size.width, _bgButton.currentImage.size.height);
    if (kScreenHeight-self.tableView.height>64+44+30) {
        _bgButton.y = self.tableView.height/2-_bgButton.currentImage.size.height/2-15-(kScreenHeight-self.tableView.height)/2+49;
    }
    _bgLabel.frame = CGRectMake(0, _bgButton.maxY+10, kScreenWidth, 20);
}
-(void)backgroundButtonAction
{
    
}
-(void)updateData{
    [self updateView];
}
-(void)updateView
{
    [self addKVOForVC];
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
    [self.tableView reloadData];
}
#pragma mark-------kv0
-(void)dealloc
{
    [self removeKVOForVC];
}
-(void)addKVOForVC
{
    if (self.dataArr.count) {
//        self.bgButton.hidden = YES;
//        self.bgLabel.hidden = YES;
//        self.tableView.hidden = NO;
        self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
        self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
    }else{
//        self.bgButton.hidden = NO;
//        self.bgLabel.hidden = NO;
//        self.tableView.hidden = YES;
        self.tableView.tableHeaderView  = self.bgHeaderView;
        self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
    }
    
//    [self.tableView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}
-(void)removeKVOForVC
{
    //[self.tableView removeObserver:self forKeyPath:@"contentSize"];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
//    DDLog(@"%@",object);
    if (self.dataArr.count) {
//        self.bgButton.hidden = YES;
//        self.bgLabel.hidden = YES;
//        self.tableView.hidden = NO;
        self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectZero];
    }else{
//        self.bgButton.hidden = NO;
//        self.bgLabel.hidden = NO;
//        self.tableView.hidden = YES;
        self.tableView.tableHeaderView  = self.bgHeaderView;
    }
}


#pragma mark-------get
-(UIView *)bgHeaderView
{
    if (!_bgHeaderView) {
        _bgHeaderView = [[UIView alloc] initWithFrame:self.tableView.bounds];
        _bgHeaderView.backgroundColor = self.tableView.backgroundColor;
    }
    return _bgHeaderView;
}
-(UILabel *)bgLabel
{
    if (!_bgLabel) {
        _bgLabel = [[UILabel alloc]init];
        _bgLabel.textColor = SHColor(120, 120, 120);
        _bgLabel.textAlignment = NSTextAlignmentCenter;
        _bgLabel.font = [UIFont systemFontOfSize:15];
//        _bgLabel.hidden = YES;
        [self.bgHeaderView addSubview:_bgLabel];
    }
    return _bgLabel;
}

-(UIButton *)bgButton
{
    if (!_bgButton) {
        _bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bgButton addTarget:self action:@selector(backgroundButtonAction) forControlEvents:UIControlEventTouchUpInside];
//        _bgButton.hidden = YES;
        [self.bgHeaderView addSubview:_bgButton];
    }
    return _bgButton;
}
#pragma mark-------UITableViewDelegate,UITableViewDataSource

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //防止空数据是上拉加载更多
    if (!_tableView.numberOfSections&&scrollView.contentOffset.y>0&&_isSetRefresh) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
}

@end
