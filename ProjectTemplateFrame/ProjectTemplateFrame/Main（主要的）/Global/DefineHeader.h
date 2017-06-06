//
//  DefineHeader.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/4/27.
//  Copyright © 2016年 sihan. All rights reserved.
//

#ifndef DefineHeader_h
#define DefineHeader_h

//手机本地话
#define kUserID @"kUserID"
#define kUser @"kUser"
#define kLogin @"kLogin"
#define kHeadImageOriginalPath @"kHeadImageOriginalPath"
#define kHeadImageCompressPath @"kHeadImageCompressPath"

//通知
#define kNotificationLogin @"kNotificationLogin"//登录
#define kNotificationKey @"kNotificationKey"
#define kNotificationTimeModify @"kNotificationTimeModify"//时间变化
#define kNotificationSearchUpdate @"kSearchUpdate"//搜索条件变化
#define kNotificationOrderUpdate @"kOrderUpdate"//搜索订单状态变化
#define kNotificationPostComment @"kPostCommentSuccess"//酒店发布评价成功
#define kNotiMessageUpdate @"kNotiMessageUpdate"//推送消息

//打印
#ifdef DEBUG // 处于开发阶段
#define DDLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define DDLog(...) /**/
#endif

//app代理
#define kAppDelegate ([UIApplication sharedApplication].delegate)
#define kStatusHeight ([UIApplication sharedApplication].statusBarFrame.size.height)
//常用方法
#define kWelf __weak typeof(self) welf=self;
//字体大小
#define kFont(font) ([UIFont systemFontOfSize:font])
#define kFontAuto(font) ([UIFont systemFontOfSize:kAutoSizeX(font)])
// RGB颜色
#define SHColor(r, g, b) SHAColor(r, g, b, 1.0)
#define SHAColor(r, g, b, alpha1) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:alpha1]
// 随机色
#define SHRandomColor SHColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
//导航栏主颜色
#define kNavBarMainColor SHColor(157, 203, 113)
#define kLineMainColor SHColor(230, 230, 230)
#define kButtonYeColor SHColor(252, 147, 59)
#define kButtonYeColor1 SHColor(233, 155, 40)
//常用颜色
#define kBlackMainColor             SHColor(51, 51, 51)
#define kBlackMian1Color            SHColor(71, 71, 71)
#define kBlackMainColor1            SHColor(71, 71, 71)
#define kTitleGrayColor0             SHColor(102, 102, 102)
#define kTitleGrayColor             SHColor(128, 128, 128)
#define kTitleGrayColor1             SHColor(153, 153, 153)
#define kLineMainColor              SHColor(230, 230, 230)
#define kBackgroundGrayDefautColor  SHColor(242, 242, 242)
//按钮颜色
#define kButtonDisDefautColor       SHColor(204, 204, 204)
#define kButtonNomDefautColor       SHColor(42, 189, 163)
#define kButtonHeiDefautColor       SHColor(34, 173, 145)
#define kButtonTitleColor           SHColor(12, 183, 243)
#define kRedTitleColor      SHColor(252, 125, 108)
#define kButtonPriceTitleColor      SHColor(255, 68, 35)
//
#define kCellSepatorDefautColor     SHColor(230, 230, 230)
#define kCellSepatorDarkColor       SHColor(204, 204, 204)
#define kDisplayBlakColor           SHColor(102, 102, 102)
#define kBtnDisTitleColor           SHColor(102, 102, 102)
#define kOranginTitleColor          SHColor(252, 146, 59)

#pragma mark=================坐标
#define kScreenWidth    ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight   ([UIScreen mainScreen].bounds.size.height)
#define kAutoSizeX(x) (kScreenWidth*(x)/375)
#define kAutoSizeY(y) (kScreenHeight*(y)/667)

//系统适配
#define SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#endif /* DefineHeader_h */
