//
//  ViewController.m
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "ViewController.h"
#import "DefineHeader.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,strong)NSArray *vcArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //数据
    [self initData];
    _tableView = [BGViewFactory creatTableViewDelegate:self];
    [self.view addSubview:_tableView];
}

-(void)initData {
    _dataArr = @[@"BGAnimationBtn展示",@"BGCommonButton展示",@"BGCommonPopView展示",@"BGLoadingHUD展示",@"BGLoopBannerView展示",@"BGMenuVCScrollerView展示",@"BGSettingVC展示",@"BGCommonFormDemoVC"];
    _vcArr = @[@"SimpleAnimationButtomVC",@"BGCommonButtonVC",@"BGPopDemoVC",@"BGLoadingHUDVC",@"BGLoopBannerViewVC",@"BGMenuScrollerVC",@"BGSettingVC",@"BGCommonFormDemoVC"];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [BGNetworking postUrl:kTestUrl parameters:@{@"name":@"11",@"pw":@"dsads"} success:^(id responseObject) {
        
    } failure:^(NSError *error) {
        
    }];
}

#pragma mark-------

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *vcStr = _vcArr[indexPath.row];
    if (NSClassFromString(vcStr)) {
        UIViewController *vc = [[NSClassFromString(vcStr) alloc] init];
        vc.view.backgroundColor = kBackgroundGrayDefautColor;
        vc.title = _dataArr[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}





@end
