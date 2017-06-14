//
//  BGCheckLoginTool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGCheckLoginTool.h"
#import "BGSaveTool.h"
#import "DefineHeader.h"
#import "ZLAlertView.h"

@implementation BGCheckLoginTool

+(BOOL)checkLoginWithVC:(UIViewController *)viewController {
    if (![BGSaveTool objectForKey:kUserID]) {
        ZLAlertView *alert = [[ZLAlertView alloc]initWithTitle:@"温馨提示" message:@"该功能需登录后使用"];
        [alert addBtnTitle:@"好的" action:^{
            
        }];
        [alert addBtnTitle:@"立即登录" action:^{
//            LoginVC *vc = [[LoginVC alloc]initWithNibName:@"LoginVC" bundle:nil];
//            [viewController.navigationController pushViewController:vc animated:YES];
            
        }];
        [alert showAlertWithSender:viewController];
        return NO;
    }
    return YES;
}

@end
