//
//  ShareItem.h
//  BGMenuVCScrollerView
//
//  Created by 黄雄彪 on 2017/6/9.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShareItem : NSObject
@property(nonatomic,strong)NSMutableArray *imageUrlArr;
@property(nonatomic,copy)NSString *iconStr;
@property(nonatomic,copy)NSString *nickName;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *adress;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,copy)NSString *commentNum;
@property(nonatomic,copy)NSString *collctionNum;
@property(nonatomic,copy)NSString *praiseNum;
@property(nonatomic,copy)NSString *isPraise;
@property(nonatomic,assign)CGFloat cellHeight;
@property(nonatomic,assign)BOOL isHelp;//是否有活动地点和人员
@property(nonatomic,copy)NSString *helpTime;//活动时间
@property(nonatomic,copy)NSString *helpAdress;//活动地点
@property(nonatomic,copy)NSString *helpNum;//活动人数
@property(nonatomic,copy)NSString *person;
@end
