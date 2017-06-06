//
//  NSString+AtriString.m
//  NingApartment
//
//  Created by 黄雄彪 on 17/5/18.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "NSString+AtriString.h"

@implementation NSString (AtriString)

-(NSMutableAttributedString*)convertArtString {
    NSMutableAttributedString *roonName = [[NSMutableAttributedString alloc]initWithString:self];
    NSRange loca = [self rangeOfString:@"："];
    if (!loca.length) {
        loca = [self rangeOfString:@":"];
    }
    if (!loca.length) return nil;
    [roonName addAttributes:@{NSForegroundColorAttributeName:kTitleGrayColor0} range:NSMakeRange(loca.location, self.length-loca.location)];
    return roonName;
}

+(NSMutableAttributedString*)convertArtString:(NSString*)string {
    NSMutableAttributedString *roonName = [[NSMutableAttributedString alloc]initWithString:string];
    NSRange loca = [string rangeOfString:@"："];
    if (!loca.length) {
        loca = [string rangeOfString:@":"];
    }
    if (!loca.length) return nil;
    [roonName addAttributes:@{NSForegroundColorAttributeName:kTitleGrayColor0} range:NSMakeRange(loca.location, string.length-loca.location)];
    return roonName;
}


@end
