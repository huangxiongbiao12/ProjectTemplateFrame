//
//  BGChoiceTimeView.h
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGCommonPopRootView.h"

@interface BGChoiceTimeView : BGCommonPopRootView
@property(nonatomic,strong)NSDate *minimumDate;//选择的最小时间
@property(nonatomic,strong)NSDate *maximumDate;//选择的最大时间
@property (nonatomic) UIDatePickerMode datePickerMode;
@end
