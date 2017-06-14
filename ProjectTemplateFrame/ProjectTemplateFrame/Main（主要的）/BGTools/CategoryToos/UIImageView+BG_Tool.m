//
//  UIImageView+BG_Tool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/14.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UIImageView+BG_Tool.h"

@implementation UIImageView (BG_Tool)

-(void)setImageBundleImageName:(NSString *)imageName {
    __block  UIImage *returnImage = nil;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
        
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        returnImage = [UIImage imageWithContentsOfFile:imagePath];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setImage:returnImage];
            
        });
    });
    
}

-(void)setImageWithImageName:(NSString *)imageName {
    __block  UIImage *returnImage = nil;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
        
        returnImage = [UIImage imageNamed:imageName];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setImage:returnImage];
        });
    });
}



@end
