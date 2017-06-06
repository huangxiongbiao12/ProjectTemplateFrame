//
//  UtilityButtonItem.h
//  PRentHouse
//
//  Created by 黄雄彪 on 17/1/4.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "Model.h"

@interface UtilityButtonItem : Model
/**
 *  快速返回实例
 *
 *  @param imageName 图片
 *  @param title     名称
 *  @param destiVC   跳转的目标控制机器
 *
 *  @return 返回实例
 */
+(UtilityButtonItem*)itemWithImage:(NSString*)imageName title:(NSString*)title destiVC:(NSString*)destiVC;
@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *destiVC;
@end
