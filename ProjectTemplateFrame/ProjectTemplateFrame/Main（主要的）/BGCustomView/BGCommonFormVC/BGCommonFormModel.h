//
//  BGCommonFormModel.h
//  HotelManager
//
//  Created by 黄雄彪 on 16/3/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BGBaseModel.h"


typedef NS_ENUM(NSInteger,BGCommonFormCellType) {
    BGCommonFormCellTypeLabel,
    BGCommonFormCellTypeText,
    BGCommonFormCellTypeTextAccessory,
    BGCommonFormCellTypeLabelAccessory
};

@interface BGCommonFormModel : BGBaseModel

@property(nonatomic,copy)NSString *title;//主标题
@property(nonatomic,strong)UIColor *titleColor;
@property(nonatomic,strong)UIFont *titleFont;

@property(nonatomic,copy)NSString *subTitle;//副标题或者是placeholder
@property(nonatomic,strong)UIColor *subTitleColor;
@property(nonatomic,strong)UIFont *subTitleFont;

@property(nonatomic,copy)NSString *content;//输入框的内容
@property(nonatomic,strong)UIColor *contentColor;
@property(nonatomic,strong)UIFont *contentFont;

@property(nonatomic,copy)NSString *accessoryStr;//右侧按钮的文字
@property(nonatomic,copy)NSString *accessoryImage;//右侧按钮的图片
@property(nonatomic,strong)UIColor *accessoryBackgroundColor;
@property(nonatomic,strong)UIColor *accessoryColor;
@property(nonatomic,strong)UIFont *accessoryFont;

@property(nonatomic,assign)BGCommonFormCellType type;//cell样式
@property(nonatomic,copy)NSString *actionType;//点击事件标识

@end
