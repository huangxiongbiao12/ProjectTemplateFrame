//
//  HXBTextView.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/25.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXBTextView : UITextView
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, strong) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;
@end
