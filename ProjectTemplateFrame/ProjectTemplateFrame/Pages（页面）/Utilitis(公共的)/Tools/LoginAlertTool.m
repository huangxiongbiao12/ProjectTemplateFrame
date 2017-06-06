//
//  LoginAlertTool.m
//  HotelClient
//
//  Created by 黄雄彪 on 17/4/18.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "LoginAlertTool.h"
#import "LoginVC.h"

@implementation LoginAlertTool

+(void)alertLoginWithVC:(UIViewController *)viewController {
    if (![HXBSaveTool objectForKey:kUserID]) {
        ZLAlertView *alert = [[ZLAlertView alloc]initWithTitle:@"温馨提示" message:@"该功能需登录后使用"];
        [alert addBtnTitle:@"好的" action:^{
            
        }];
        [alert addBtnTitle:@"立即登录" action:^{
            LoginVC *vc = [[LoginVC alloc]initWithNibName:@"LoginVC" bundle:nil];
            [viewController.navigationController pushViewController:vc animated:YES];
            
        }];
        [alert showAlertWithSender:viewController];
        return;
    }
}

@end
