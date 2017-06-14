//
//  BGColorTool.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/14.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kGrey          [UIColor colorWithRed:246.0 / 255.0 green:246.0 / 255.0 blue:246.0 / 255.0 alpha:1.0f]
#define kLightBlue     [UIColor colorWithRed:94.0 / 255.0 green:147.0 / 255.0 blue:196.0 / 255.0 alpha:1.0f]
#define kGreen         [UIColor colorWithRed:77.0 / 255.0 green:186.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f]
#define kTitleColor    [UIColor colorWithRed:0.0 / 255.0 green:189.0 / 255.0 blue:113.0 / 255.0 alpha:1.0f]
#define kButtonGrey    [UIColor colorWithRed:141.0 / 255.0 green:141.0 / 255.0 blue:141.0 / 255.0 alpha:1.0f]
#define kLightGreen    [UIColor colorWithRed:77.0 / 255.0 green:216.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f]
#define kFreshGreen    [UIColor colorWithRed:77.0 / 255.0 green:196.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f]
#define kDeepGreen     [UIColor colorWithRed:77.0 / 255.0 green:176.0 / 255.0 blue:122.0 / 255.0 alpha:1.0f]
#define kRed           [UIColor colorWithRed:245.0 / 255.0 green:94.0 / 255.0 blue:78.0 / 255.0 alpha:1.0f]
#define kMauve         [UIColor colorWithRed:88.0 / 255.0 green:75.0 / 255.0 blue:103.0 / 255.0 alpha:1.0f]
#define kBrown         [UIColor colorWithRed:119.0 / 255.0 green:107.0 / 255.0 blue:95.0 / 255.0 alpha:1.0f]
#define kBlue          [UIColor colorWithRed:82.0 / 255.0 green:116.0 / 255.0 blue:188.0 / 255.0 alpha:1.0f]
#define kDarkBlue      [UIColor colorWithRed:121.0 / 255.0 green:134.0 / 255.0 blue:142.0 / 255.0 alpha:1.0f]
#define kYellow        [UIColor colorWithRed:242.0 / 255.0 green:197.0 / 255.0 blue:117.0 / 255.0 alpha:1.0f]
#define kWhite         [UIColor colorWithRed:255.0 / 255.0 green:255.0 / 255.0 blue:255.0 / 255.0 alpha:1.0f]
#define kDeepGrey      [UIColor colorWithRed:99.0 / 255.0 green:99.0 / 255.0 blue:99.0 / 255.0 alpha:1.0f]
#define kPinkGrey      [UIColor colorWithRed:200.0 / 255.0 green:193.0 / 255.0 blue:193.0 / 255.0 alpha:1.0f]
#define kHealYellow    [UIColor colorWithRed:245.0 / 255.0 green:242.0 / 255.0 blue:238.0 / 255.0 alpha:1.0f]
#define kLightGrey     [UIColor colorWithRed:225.0 / 255.0 green:225.0 / 255.0 blue:225.0 / 255.0 alpha:1.0f]
#define kCleanGrey     [UIColor colorWithRed:251.0 / 255.0 green:251.0 / 255.0 blue:251.0 / 255.0 alpha:1.0f]
#define kLightYellow   [UIColor colorWithRed:241.0 / 255.0 green:240.0 / 255.0 blue:240.0 / 255.0 alpha:1.0f]
#define kDarkYellow    [UIColor colorWithRed:152.0 / 255.0 green:150.0 / 255.0 blue:159.0 / 255.0 alpha:1.0f]
#define kPinkDark      [UIColor colorWithRed:170.0 / 255.0 green:165.0 / 255.0 blue:165.0 / 255.0 alpha:1.0f]
#define kCloudWhite    [UIColor colorWithRed:244.0 / 255.0 green:244.0 / 255.0 blue:244.0 / 255.0 alpha:1.0f]
#define kBlack         [UIColor colorWithRed:45.0 / 255.0 green:45.0 / 255.0 blue:45.0 / 255.0 alpha:1.0f]
#define kStarYellow    [UIColor colorWithRed:252.0 / 255.0 green:223.0 / 255.0 blue:101.0 / 255.0 alpha:1.0f]
#define kTwitterColor  [UIColor colorWithRed:0.0 / 255.0 green:171.0 / 255.0 blue:243.0 / 255.0 alpha:1.0]
#define kWeiboColor    [UIColor colorWithRed:250.0 / 255.0 green:0.0 / 255.0 blue:33.0 / 255.0 alpha:1.0]
#define kIOSGreenColor [UIColor colorWithRed:98.0 / 255.0 green:247.0 / 255.0 blue:77.0 / 255.0 alpha:1.0]

@interface BGColorTool : NSObject

+ (UIImage *)imageFromColor:(UIColor *)color;

@end
