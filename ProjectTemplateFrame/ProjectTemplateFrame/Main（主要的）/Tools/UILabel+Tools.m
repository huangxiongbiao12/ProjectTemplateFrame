//
//  UILabel+Tools.m
//  NingApartment
//
//  Created by 黄雄彪 on 17/2/28.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UILabel+Tools.h"

@implementation UILabel (Tools)

-(double)fitHeightForTitle {
    self.numberOfLines = 0;
    self.height = [self.text boundingRectWithSize:CGSizeMake(self.width, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.height+15;
    return [self.text boundingRectWithSize:CGSizeMake(self.width, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.height+15;
}

-(double)fitWidthForTitle {
    self.numberOfLines = 0;
    self.width = [self.text boundingRectWithSize:CGSizeMake(10000, self.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.width+20;
    return [self.text boundingRectWithSize:CGSizeMake(10000, self.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.width+20;
}

@end
