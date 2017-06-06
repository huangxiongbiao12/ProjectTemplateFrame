//
//  HWSearchBar.m
//  黑马微博2期
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HXBSearchBar.h"

@interface HXBSearchBar ()
{
    UIButton *_rightBtn;
}
@end

@implementation HXBSearchBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索条件";
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        self.returnKeyType = UIReturnKeySearch;
        // 通过init来创建初始化绝大部分控件，控件都是没有尺寸
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        //第一步,对组件增加监听器
        [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
    }
    return self;
}

-(void)setRightBtnTitle:(NSString *)rightBtnTitle
{
    if (rightBtnTitle==nil) {
        [_rightBtn removeFromSuperview];
        return;
    }
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_rightBtn setTitle:@"取消" forState:UIControlStateNormal];
        _rightBtn.width = 55;
        _rightBtn.height = 30;
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(sureBtn:) forControlEvents:UIControlEventTouchUpInside];
        self.rightView = _rightBtn;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
    _rightBtnTitle = rightBtnTitle;
    [_rightBtn setTitle:rightBtnTitle forState:UIControlStateNormal];
}

+ (instancetype)searchBar
{
    return [[self alloc] init];
}

-(void)sureBtn:(UIButton*)btn
{
    if ([btn.titleLabel.text isEqualToString:@"取消"]) {
        [self resignFirstResponder];
        if ([self.delegate respondsToSelector:@selector(textDidChange:)]) {
            self.text = @"";
            [self.delegate textDidChange:@""];
        }
    }
    if ([self.delegate respondsToSelector:@selector(searchForKey:)]) {
        [self.delegate searchForKey:self.text.length?self.text:@""];
    }
}

//第二步,实现回调函数
- (void) textFieldDidChange:(id) sender {
    if ([self.delegate respondsToSelector:@selector(textDidChange:)]) {
        [self.delegate textDidChange:self.text];
    }
}

@end
