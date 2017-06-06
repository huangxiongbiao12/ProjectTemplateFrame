//
//  UtitltyButtonCollectionViewCell.h
//  PRentHouse
//
//  Created by 黄雄彪 on 17/1/4.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UtilityButtonItem.h"

@interface UtitltyButtonCollectionViewCell : UICollectionViewCell
/**
 *  设置UI内容
 */
@property(nonatomic,copy)UtilityButtonItem *item;
/**
 *  设置距离
 *
 *  @param top    图片到上面的距离
 *  @param inter  图片文字的距离
 *  @param bottom 文字到下方的距离
 */
-(void)setTop:(CGFloat)top inter:(CGFloat)inter bottom:(CGFloat)bottom;
-(void)setInnerD:(CGFloat)inner;
-(CGFloat)getCellHeight;
@end
