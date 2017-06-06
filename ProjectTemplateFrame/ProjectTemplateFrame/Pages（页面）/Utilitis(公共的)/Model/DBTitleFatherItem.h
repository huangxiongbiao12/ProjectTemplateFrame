//
//  UtilityChoiceFatherItem.h
//  PRentHouse
//
//  Created by 黄雄彪 on 17/1/6.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "Model.h"

@interface DBTitleFatherItem : Model
{
    NSString *_title;
    NSString *_subTitle;
}
/**
 *   项目名称
 */
@property(nonatomic,copy)NSString *title;
/**
 *  名目label是的选择内容
 */
@property(nonatomic,copy)NSString *subTitle;
/**
 *  是否被选中,默认no
 */
@property(nonatomic,assign)BOOL selected;

+(instancetype)itemWithTitle:(NSString*)title subTitle:(NSString*)subTitle;

@end
