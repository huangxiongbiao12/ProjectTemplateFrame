//
//  DoubleTitleButton.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/31.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoubleTitleButton : UIButton

+(DoubleTitleButton*)buttonWithFrame:(CGRect)frame title:(NSString*)title subTitle:(NSString*)subTitle;
@property(nonatomic,strong)UILabel *mainTitleLabel;
@property(nonatomic,strong)UILabel *subTitleLabel;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *subTitle;

@property(nonatomic,strong)UIColor *selectColor;

@end
