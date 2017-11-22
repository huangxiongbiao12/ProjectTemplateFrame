//
//  RandomKeyManager.h
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/11/21.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RandomKeyManager : NSObject

/**
 单例

 @return 单例对象
 */
+ (RandomKeyManager*)shareRandomKey;

/**
    获取加密随机数
 
 @return 加密随机数
 */
-(NSString*)getRandomKey;

@end
