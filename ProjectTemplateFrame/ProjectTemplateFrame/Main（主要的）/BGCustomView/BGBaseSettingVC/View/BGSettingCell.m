//
//  BGSettingCell.m
//  testBGSettingDemo
//
//  Created by 黄雄彪 on 16/3/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGSettingCell.h"

#define ios7 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0)

@interface BGSettingCell ()

@property(nonatomic,strong)UISwitch *switchView;

@property(nonatomic,strong)UIImageView *arrowView;

@property(nonatomic,strong)UILabel *labelView;

@end

@implementation BGSettingCell

+(BGSettingCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    BGSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[BGSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    return cell;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

-(void)setItem:(BGSettingItem *)item
{
    _item = item;
    self.textLabel.text = item.title;
    self.imageView.image = [UIImage imageNamed:item.iconStr];
    
    switch (item.itemType) {
            //箭头类型
        case ItemTypeArrow:{
            self.accessoryView = self.arrowView;
            self.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
            
            break;
            //开关类型
        case ItemTypeSwitch:{
            self.accessoryView = self.switchView;
            self.switchView.on = item.onSwitch;
            self.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            
            break;
            //标签
        case ItemTypeLabel:{
            self.accessoryView = self.labelView;
            self.labelView.text = item.text;
            self.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
            
            break;
            
        default:{
            self.accessoryView = nil;
            self.selectionStyle = UITableViewCellSelectionStyleNone;
        }
            break;
    }
}

//保持开关状态在setter方法里面
-(void)switchAction:(UISwitch*)swi
{
    self.item.onSwitch = swi.on;
}

-(UISwitch *)switchView
{
    if (!_switchView) {
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchView;
}

-(UILabel *)labelView
{
    if (!_labelView) {
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 100, 44);
        _labelView.textColor = [UIColor redColor];
        _labelView.textAlignment = NSTextAlignmentRight;
    }
    return _labelView;
}
-(UIImageView *)arrowView
{
    if (!_arrowView) {
        _arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return _arrowView;
}


@end
