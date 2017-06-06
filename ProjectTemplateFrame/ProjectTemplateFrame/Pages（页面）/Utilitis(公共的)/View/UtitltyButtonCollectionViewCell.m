//
//  UtitltyButtonCollectionViewCell.m
//  PRentHouse
//
//  Created by 黄雄彪 on 17/1/4.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UtitltyButtonCollectionViewCell.h"

@interface UtitltyButtonCollectionViewCell ()

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageH;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageW;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topD;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *interD;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomD;

@end

@implementation UtitltyButtonCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _topD.constant = 8;
    _interD.constant = 5;
    _bottomD.constant = 8;
    _titleLabel.font = [UIFont systemFontOfSize:12];
}

-(void)setItem:(UtilityButtonItem *)item {
    _item = item;
    _imageView.image = [UIImage imageNamed:item.imageName];
    _titleLabel.text = item.title;
    _imageW.constant = _imageView.image.size.width;
    _imageH.constant = _imageView.image.size.height;
}

-(void)setInnerD:(CGFloat)inner {
    _interD.constant = inner;
    _topD.constant = (self.height-inner-20-_imageH.constant)/2;
    _bottomD.constant = (self.height-inner-20-_imageH.constant)/2;
}

-(void)setTop:(CGFloat)top inter:(CGFloat)inter bottom:(CGFloat)bottom {
    _topD.constant = top;
    _interD.constant = inter;
    _bottomD.constant = bottom;
}

-(CGFloat)getCellHeight {
    return _imageH.constant+_topD.constant+_interD.constant+_bottomD.constant;
}

@end
