//
//  UILabel+BG_Tool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UILabel+BG_Tool.h"
#import "UIView+BG_Tool.h"

@implementation UILabel (BG_Tool)

-(double)fitHeightForTitle {
    self.numberOfLines = 0;
    self.height = [self.text boundingRectWithSize:CGSizeMake(self.width, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.height+15;
    return [self.text boundingRectWithSize:CGSizeMake(self.width, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.height;
}

-(double)fitWidthForTitle {
    self.numberOfLines = 0;
    self.width = [self.text boundingRectWithSize:CGSizeMake(10000, self.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.width+20;
    return [self.text boundingRectWithSize:CGSizeMake(10000, self.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.width;
}

@end
