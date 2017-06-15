//
//  BGCommonFormDemoVC.m
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGCommonFormDemoVC.h"

@interface BGCommonFormDemoVC ()<BGCommonFormCellDelegate>

@end

@implementation BGCommonFormDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *titles = @[@[@"姓名",@"身份证",@"性别"],@[@"天数",@"价格"]];
    NSArray *subTitles = @[@[@"刘德华",@"请输入身份证",@"男"],@[@"请输入天数",@"100"]];
    NSArray *contents = @[@[@"",@"",@""],@[@"",@""]];
    NSArray *accesorys = @[@[@"明细",@"明细1",@"明细2"],@[@"明细3",@"明细4"]];
    NSArray *accesoryImages = @[@[@"",@"",@""],@[@"",@""]];
    NSArray *acctionTypes = @[@[@"1",@"2",@"3"],@[@"4",@"5"]];
    
    for (int i = 0; i < titles.count; i++) {
        BGCommonFormGroup *group1 = [BGCommonFormGroup new];
        group1.headerStr = [NSString stringWithFormat:@"第%d组",i];
        for (int j = 0; j < [titles[i] count]; j++) {
            // 可用字典将model可上传的字段关联方便取值上传
            BGCommonFormModel *model = [BGCommonFormModel new];
            model.title = titles[i][j];
            model.subTitle = subTitles[i][j];
            model.content = contents[i][j];
            model.accessoryStr = accesorys[i][j];
            model.accessoryImage = accesoryImages[i][j];
            model.actionType = acctionTypes[i][j];
            model.type = j+i;
            [group1.items addObject:model];
        }
        [_dataArr addObject:group1];
    }
    
}

#pragma mark-------

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void)commonFormCell:(BGCommonFormCell *)cell actionType:(NSString *)actionType {
    NSLog(@"%@===点击",actionType);
}

@end
