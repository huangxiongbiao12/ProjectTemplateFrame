//
//  HWSearchBar.h
//  黑马微博2期
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HXBSearchBarDelegate <UITextFieldDelegate>

@optional
-(void)searchForKey:(NSString*)keyWord;
-(void)textDidChange:(NSString*)text;

@end

@interface HXBSearchBar : UITextField

+ (instancetype)searchBar;
@property(nonatomic,copy)NSString *rightBtnTitle;//右侧按钮的名称
@property(nullable, nonatomic,weak)   id<HXBSearchBarDelegate> delegate;

@end
