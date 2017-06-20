//
//  FatherListVC.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/6/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "FatherListVC.h"
#import "MJRefresh.h"

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
        _isCellNIB = YES;
        _cellClass = @"UITableViewCell";
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
    }
    if (_cellClass.length&&NSClassFromString(_cellClass)) {
        if (_isCellNIB) {
            [_tableView registerNib:[UINib nibWithNibName:_cellClass bundle:nil] forCellReuseIdentifier:_cellClass];
        }else {
            [_tableView registerClass:NSClassFromString(_cellClass) forCellReuseIdentifier:_cellClass];
        }
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

-(void)addKVOForVC
{
    if (self.dataArr.count) {
        self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
        self.tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
    }else{
        self.tableView.tableHeaderView  = self.bgHeaderView;
        self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.1)];
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
        [self.bgHeaderView addSubview:_bgLabel];
    }
    return _bgLabel;
}

-(UIButton *)bgButton
{
    if (!_bgButton) {
        _bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_bgButton addTarget:self action:@selector(backgroundButtonAction) forControlEvents:UIControlEventTouchUpInside];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellClass];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //防止空数据是上拉加载更多
    if (!_tableView.numberOfSections&&scrollView.contentOffset.y>0&&_isSetRefresh) {
        scrollView.contentOffset = CGPointMake(0, 0);
    }
}

@end
