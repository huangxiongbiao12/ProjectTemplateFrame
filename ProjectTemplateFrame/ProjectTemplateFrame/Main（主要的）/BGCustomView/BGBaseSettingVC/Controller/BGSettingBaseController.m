//
//  BGSettingBaseController.m
//  testBGSettingDemo
//
//  Created by 黄雄彪 on 16/3/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGSettingBaseController.h"
#import "BGSettingCell.h"


@interface BGSettingBaseController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation BGSettingBaseController

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
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [BGViewFactory creatTableViewGroupDelegate:self];
    _tableView.sectionFooterHeight = 0;
    [self.view addSubview:_tableView];

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    BGSettingGroup *group = self.dataArr[section];
    return group.items.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BGSettingCell *cell = [BGSettingCell cellWithTableView:tableView];

    BGSettingGroup *group = _dataArr[indexPath.section];
    
    cell.item = group.items[indexPath.row];
    
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [_dataArr[section] footterStr];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_dataArr[section] headerStr];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BGSettingItem *item = [_dataArr[indexPath.section] items][indexPath.row];
    
    if (item.option) {
        item.option();
        return;
    }
    
    if (NSClassFromString(item.desVcName)) {
        
        UIViewController *vc = [[NSClassFromString(item.desVcName) alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

@end
