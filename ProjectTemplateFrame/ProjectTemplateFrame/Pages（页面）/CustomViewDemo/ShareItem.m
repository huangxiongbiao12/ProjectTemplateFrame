//
//  ShareItem.m
//  BGMenuVCScrollerView
//
//  Created by 黄雄彪 on 2017/6/9.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "ShareItem.h"

@implementation ShareItem

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageUrlArr = [NSMutableArray array];
    }
    return self;
}

-(CGFloat)cellHeight
{
    if (!_cellHeight) {
        
        CGSize size = [self.content boundingRectWithSize:CGSizeMake(kScreenWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        _cellHeight = 60+40+size.height+10+20;
        if (self.imageUrlArr.count>0) {
            _cellHeight = 60+40+size.height+10+(kScreenWidth-40)/3+10+20;
        }
        if (_isHelp) {
            _cellHeight += 120;
        }
    }
    return _cellHeight;
}


@end
