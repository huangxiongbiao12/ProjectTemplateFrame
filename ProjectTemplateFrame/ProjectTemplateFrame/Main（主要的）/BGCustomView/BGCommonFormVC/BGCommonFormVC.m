//
//  BGCommonFormVC.m
//  HotelManager
//
//  Created by 黄雄彪 on 16/3/3.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGCommonFormVC.h"
#import "BGCommonFormGroup.h"

@interface BGCommonFormVC ()
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BGCommonFormVC

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataArr = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    tableview
    _tableView = [BGViewFactory creatTableViewGroupDelegate:self];
    [_tableView registerNib:[UINib nibWithNibName:@"BGCommonFormCell" bundle:nil] forCellReuseIdentifier:@"BGCommonFormCell"];
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
}

#pragma mark===============tabview代理方法==================

#pragma mark===============UITableViewDataSource==================

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArr[section].items count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BGCommonFormCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BGCommonFormCell"];
    cell.model = _dataArr[indexPath.section].items[indexPath.row];
    cell.delegate = self;
    return cell;
    
}

#pragma mark===============UITableViewDelegate==================

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _dataArr[section].headerStr;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

@end
