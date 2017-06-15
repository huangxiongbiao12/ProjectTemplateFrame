//
//  BGCommonFormGroup.h
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGBaseModel.h"
#import "BGCommonFormModel.h"

@interface BGCommonFormGroup : BGBaseModel

@property(nonatomic,copy)NSString *headerStr;

@property(nonatomic,copy)NSString *footterStr;

@property(nonatomic,strong)NSMutableArray <BGCommonFormModel*>*items;

@end
