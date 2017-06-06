//
//  UserModel.h
//  LoveE
//
//  Created by 黄雄彪 on 16/4/20.
//  Copyright © 2016年 huangxiongbiao. All rights reserved.
//

#import "Model.h"

@interface UserModel : Model

@property(nonatomic,copy)NSString *k_user_id;//: 手机号
@property(nonatomic,copy)NSString *k_name;//: 用户姓名
@property(nonatomic,copy)NSString *k_idcard;//: 身份证号
@property(nonatomic,copy)NSString *K_imei;//: 手机 IMEI
@property(nonatomic,copy)NSString *usrid;
@end
