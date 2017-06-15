//
//  BGSettingVC.m
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGSettingVC.h"
#import "BGSettingGroup.h"

@interface BGSettingVC ()

@end

@implementation BGSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *titleArr = @[@[@"推送消息",@"摇一摇机选",@"声音效果"],@[@"检查新版本",@"帮助",@"分享",@"查看消息",@"产品推荐",@"关于"]];
    NSArray *iconArr = @[@[@"MorePush",@"handShake",@"sound_Effect"],@[@"MoreUpdate",@"MoreHelp",@"MoreShare",@"MoreMessage",@"IDInfo",@"MoreAbout"]];
    
    for (NSInteger section = 0; section < titleArr.count; section++) {
        BGSettingGroup *group = [[BGSettingGroup alloc] init];
        group.headerStr = [NSString stringWithFormat:@"第 %ld 组",section+1];
        for (NSInteger row = 0; row < [titleArr[section] count]; row++) {
            BGSettingItem *item = [BGSettingItem itemWithIconStr:iconArr[section][row] title:titleArr[section][row] itemType:ItemTypeArrow];
            
            if (section==0&&(row==1|row==2)) {
                item.itemType = ItemTypeSwitch;
                item.onForKey = [NSString stringWithFormat:@"%ld",row];
                //                item.defaultIsOn = row-1;
            }else if (section==1&&row==0){
                
                item.option = ^{
                    [MBProgressHUD showMessage:@"检查中..."];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [MBProgressHUD hideHUD];
                        
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"发现新版本" message:@"立即更新" delegate:self cancelButtonTitle:nil otherButtonTitles:@"取消",@"确定", nil];
                        [alert show];
                    });
                    
                    
                };
            }else{
                item.desVcName = @"BGLoadingHUDVC";
            }
            [group.items addObject:item];
        }
        [self.dataArr addObject:group];
    }
}


@end
