//
//  BGCommonFormCell.h
//  HotelManager
//
//  Created by 黄雄彪 on 16/3/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGCommonFormGroup.h"

@class BGCommonFormCell;

@protocol BGCommonFormCellDelegate <NSObject>

@optional
-(void)commonFormCell:(BGCommonFormCell*)cell actionType:(NSString*)actionType;//右侧按钮点击事件

@end


@interface BGCommonFormCell : UITableViewCell

@property(nonatomic,weak) id<BGCommonFormCellDelegate>delegate;
@property(nonatomic,strong)BGCommonFormModel *model;//数据模型

@end
