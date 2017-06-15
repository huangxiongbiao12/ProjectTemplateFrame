//
//  BGCommonFormVC.h
//  HotelManager
//
//  Created by 黄雄彪 on 16/3/3.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGCommonFormModel.h"
#import "BGCommonFormCell.h"

@interface BGCommonFormVC : UIViewController<UITableViewDataSource,UITableViewDelegate,BGCommonFormCellDelegate>
{
    NSMutableArray <BGCommonFormGroup*>*_dataArr;
}
//数据元
@property(nonatomic,strong)NSMutableArray <BGCommonFormGroup*>*dataArr;

@end
