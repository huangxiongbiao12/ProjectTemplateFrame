//
//  BGSettingCell.h
//  testBGSettingDemo
//
//  Created by 黄雄彪 on 16/3/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGSettingGroup.h"
#import "BGSettingItem.h"

@interface BGSettingCell : UITableViewCell

@property(nonatomic,copy)BGSettingItem *item;

+(BGSettingCell*)cellWithTableView:(UITableView*)tableView;

@end
