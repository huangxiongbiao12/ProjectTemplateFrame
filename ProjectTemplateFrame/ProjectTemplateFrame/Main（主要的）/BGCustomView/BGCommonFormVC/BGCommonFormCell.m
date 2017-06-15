//
//  BGCommonFormCell.m
//  HotelManager
//
//  Created by 黄雄彪 on 16/3/4.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGCommonFormCell.h"

@interface BGCommonFormCell ()<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (strong, nonatomic) IBOutlet UIButton *rightBtn;

@property (strong, nonatomic) IBOutlet UITextField *contentTF;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightBtnWidth;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightBtnHeight;

@end

@implementation BGCommonFormCell


-(void)setModel:(BGCommonFormModel *)model
{
    _model = model;
    _rightBtn.hidden = YES;
    _subTitleLabel.hidden = YES;
    _contentTF.hidden = YES;
    
    _titleLabel.text = model.title;
    _titleLabel.textColor = model.titleColor;
    _titleLabel.font = model.titleFont;
    [self setPropertyView:model];
    switch (model.type) {
        case BGCommonFormCellTypeText://输入框
        {
            _contentTF.hidden = NO;
            _contentTF.placeholder = model.subTitle;
            _contentTF.text = model.content;
        }
            break;
        case BGCommonFormCellTypeLabel://标签
        {
            _subTitleLabel.hidden = NO;
            _subTitleLabel.text = model.subTitle;
        }
            break;
        case BGCommonFormCellTypeTextAccessory://右侧带按钮的输入框
        {
            _rightBtn.hidden = NO;
            _contentTF.hidden = NO;
            _contentTF.placeholder = model.subTitle;
            _contentTF.text = model.content;
            if (model.accessoryImage.length) {
                [_rightBtn setImage:[UIImage imageNamed:model.accessoryImage] forState:UIControlStateNormal];
                _rightBtnWidth.constant = _rightBtn.currentImage.size.width;
                _rightBtnHeight.constant = _rightBtn.currentImage.size.height;
            }
            if (model.accessoryStr.length) {
                [_rightBtn setTitle:model.accessoryStr forState:UIControlStateNormal];
                [_rightBtn setTitleColor:kNavBarMainColor forState:UIControlStateNormal];
                _rightBtnWidth.constant = [_rightBtn fitWidthForTitle];
            }
            _rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        }
            break;
        case BGCommonFormCellTypeLabelAccessory://右侧带按钮的标签
        {
            _rightBtn.hidden = NO;
            _subTitleLabel.hidden = NO;
            _subTitleLabel.text = model.subTitle;
            if (model.accessoryImage.length) {
                [_rightBtn setImage:[UIImage imageNamed:model.accessoryImage] forState:UIControlStateNormal];
            }
            if (model.accessoryStr.length) {
                [_rightBtn setTitle:model.accessoryStr forState:UIControlStateNormal];
                [_rightBtn setTitleColor:kNavBarMainColor forState:UIControlStateNormal];
            }
            _rightBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        }
            break;
            
        default:
            break;
    }
    
}

-(void)setPropertyView:(BGCommonFormModel*)model {
    
    _titleLabel.textColor = model.titleColor;
    _titleLabel.font = model.titleFont;
    _subTitleLabel.textColor = model.subTitleColor;
    _subTitleLabel.font = model.subTitleFont;
    _contentTF.font = model.contentFont;
    _contentTF.textColor = model.contentColor;
    _contentTF.placeFont = model.contentFont;
    _contentTF.placeColor = kTitleGrayColor;
    [_rightBtn setTitleColor:model.accessoryColor forState:UIControlStateNormal];
    _rightBtn.titleLabel.font = model.accessoryFont;
    _rightBtn.backgroundColor = model.accessoryBackgroundColor;
    
}


#pragma mark-------

- (IBAction)rightBtnAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(commonFormCell:actionType:)]) {
        [self.delegate commonFormCell:self actionType:_model.actionType];
    }
}


#pragma mark-------UITextFieldDelegate

- (IBAction)textChange:(id)sender {
    self.model.content = ((UITextField*)sender).text;
}

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

@end
