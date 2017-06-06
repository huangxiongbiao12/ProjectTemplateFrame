//
//  RegisterVC.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/4/27.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterVC : UIViewController
@property(nonatomic,copy)void(^regsiterSuc)(NSString *user,NSString *pw);
@end
