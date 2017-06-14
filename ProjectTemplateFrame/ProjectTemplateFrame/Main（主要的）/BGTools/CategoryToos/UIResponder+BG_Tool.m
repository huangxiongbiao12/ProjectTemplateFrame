//
//  UIResponder+BG_Tool.m
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UIResponder+BG_Tool.h"
#import "UIView+BG_Tool.h"

static CGRect initFrame;
static UIButton *endButton=nil;

#define MainWindow [[UIApplication sharedApplication].delegate window]

#define IsEvent [self isKindOfClass:[UITextField class]]||[self isKindOfClass:[UITextView class]]


@implementation UIResponder (BG_Tool)

/**
 
 实现UIResponder
 
 **/

-(instancetype)init {
    
    if (self=[super init]) {
        [self registerKeyboardManagement];//注册键盘的监听
    }
    return self;
    
}

#pragma mark - ============ 其他 ============
/**
 
 注册键盘的监听
 
 **/
-(void)registerKeyboardManagement {
    if (IsEvent) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNotificationAction:) name:UIKeyboardWillHideNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardNotificationAction:) name:UIKeyboardWillShowNotification object:nil];
    }
}

-(void)dealloc {
    if (IsEvent) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    }
}

#pragma mark - ============ 给类触发事件 ============

#pragma mark - 键盘通知

- (void)keyboardNotificationAction:(NSNotification *)notification {
    
    if (!self.isFirstResponder) {
        if ([notification.name isEqualToString:UIKeyboardWillHideNotification]) {
            UIView *view =[MainWindow.subviews objectAtIndex:0];
            NSValue *value =[NSValue valueWithCGRect:initFrame];
            if (!([value isEqualToValue:[NSValue valueWithCGRect:CGRectNull]]||[value isEqualToValue:[NSValue valueWithCGRect:CGRectZero]])) {
                view.frame=initFrame;
                initFrame=CGRectZero;
            }
            [endButton removeFromSuperview];
            MainWindow.backgroundColor=[UIColor clearColor];
        }
    } else {
        if ([notification.name isEqualToString:UIKeyboardWillHideNotification]) {
            UIView *view =[MainWindow.subviews objectAtIndex:0];
            NSValue *value =[NSValue valueWithCGRect:initFrame];
            if (!([value isEqualToValue:[NSValue valueWithCGRect:CGRectNull]]||[value isEqualToValue:[NSValue valueWithCGRect:CGRectZero]])) {
                view.frame=initFrame;
                initFrame=CGRectZero;
            }
            [endButton removeFromSuperview];
            MainWindow.backgroundColor=[UIColor clearColor];
            
        }
        else if ([notification.name isEqualToString:UIKeyboardWillShowNotification]) {
            CGRect keyboardFrame = ((NSValue *) notification.userInfo[UIKeyboardFrameEndUserInfoKey]).CGRectValue;
            UIView *sfView=(UIView*)self;
            
            /**
             
             计算输入框相对于MainWindow的位置
             
             **/
            
            CGRect rect =[MainWindow convertRect:sfView.frame fromView:sfView.superview];
            CGFloat tfMaxY = rect.origin.y+rect.size.height;
            //            if (rect.origin.y<kScreenHeight-49) {
            //                tfMaxY = tfMaxY>kScreenHeight?kScreenHeight-49-22:tfMaxY;
            //            }else {
            //                tfMaxY = tfMaxY>kScreenHeight?kScreenHeight:tfMaxY;
            //            }
            CGFloat y=tfMaxY-keyboardFrame.origin.y;
            UIView *view =[MainWindow.subviews objectAtIndex:0];
            NSValue *value =[NSValue valueWithCGRect:initFrame];
            if ([value isEqualToValue:[NSValue valueWithCGRect:CGRectNull]]||[value isEqualToValue:[NSValue valueWithCGRect:CGRectZero]]) {
                initFrame=view.frame;
            }
            if (!endButton) {
                endButton=[UIButton buttonWithType:UIButtonTypeSystem];
                endButton.frame=CGRectMake(keyboardFrame.size.width-69, keyboardFrame.origin.y-22, 64, 22);
                endButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
                [endButton setTitle:@"结束编辑" forState:UIControlStateNormal];
                endButton.titleLabel.font=[UIFont systemFontOfSize:15.0f];
                [endButton addTarget:MainWindow action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            }
            [MainWindow addSubview:endButton];
            MainWindow.backgroundColor=[UIColor whiteColor];
            if (y>0) {
                view.y = view.y-y-endButton.height;
                //                view.frame=CGRectMake(view.frame.origin.x, view.frame.origin.y-y-endButton.frame.size.height, view.frame.size.width, view.frame.size.height);
            }
        }
    }
}

#pragma mark - buttonAction

-(void)buttonAction:(UIButton *)sender {
    [MainWindow endEditing:YES];
}

@end
