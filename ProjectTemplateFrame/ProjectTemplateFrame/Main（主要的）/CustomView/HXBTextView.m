//
//  HXBTextView.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/25.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "HXBTextView.h"

@interface HXBTextView ()
@property (nonatomic, strong) UILabel *placeHolderLabel;
@end

@implementation HXBTextView

CGFloat const UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION = 0.0;
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//- (void)awakeFromNib
//{
//    [super awakeFromNib];
//    if (!self.placeholder) {
//        [self setPlaceholder:@""];
//    }
//    if (!self.placeholderColor) {
//        [self setPlaceholderColor:[UIColor lightGrayColor]];
//    }
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
//}
- (id)initWithFrame:(CGRect)frame
{
    if( (self = [super initWithFrame:frame]) )
    {
        [self setPlaceholder:@""];
        [self setPlaceholderColor:[UIColor lightGrayColor]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}
- (void)textChanged:(NSNotification *)notification
{
    if([[self placeholder] length] == 0)
    {
        return;
    }
    [UIView animateWithDuration:UI_PLACEHOLDER_TEXT_CHANGED_ANIMATION_DURATION animations:^{
        if([[self text] length] == 0)
        {
            [_placeHolderLabel setAlpha:1];
        }
        else
        {
            [_placeHolderLabel setAlpha:0];
        }
    }];
}
- (void)setText:(NSString *)text {
    [super setText:text];
    [self textChanged:nil];
}
- (void)drawRect:(CGRect)rect
{
    if( [[self placeholder] length] > 0 )
    {
        if (_placeHolderLabel == nil )
        {
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8,8,self.bounds.size.width-16,10)];
            _placeHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _placeHolderLabel.font = [UIFont systemFontOfSize:13];
            _placeHolderLabel.numberOfLines =0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview:_placeHolderLabel];
        }
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    if( [[self text] length] == 0 && [[self placeholder] length] > 0 )
    {
        [_placeHolderLabel setAlpha:1];
    }
    [super drawRect:rect];
}

@end
