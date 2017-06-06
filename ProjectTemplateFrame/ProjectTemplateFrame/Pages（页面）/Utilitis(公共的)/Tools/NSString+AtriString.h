//
//  NSString+AtriString.h
//  NingApartment
//
//  Created by 黄雄彪 on 17/5/18.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (AtriString)

+(NSMutableAttributedString*)convertArtString:(NSString*)string;
-(NSMutableAttributedString*)convertArtString;

@end
