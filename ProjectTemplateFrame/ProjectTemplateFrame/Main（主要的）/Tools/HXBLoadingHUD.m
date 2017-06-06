//
//  HXBLoadingHUD.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/6/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "HXBLoadingHUD.h"
#import "GifView.h"

@interface HXBLoadingHUD ()
{
    UIImageView *_imageView;
}

@property(nonatomic,strong)UIActivityIndicatorView *activeView;
@property(nonatomic,strong)GifView *loadingGifview;
@property (nonatomic, assign) NSString *messageText;
@property (nonatomic, readonly) BOOL isAnimating;

@end

@implementation HXBLoadingHUD

+(HXBLoadingHUD *)showMessage:(NSString *)message toView:(UIView *)view withGifFilePath:(NSString*)filePath
{
    HXBLoadingHUD *hud = [[HXBLoadingHUD alloc]initWithFrame:view.bounds];
    [hud creatAnimationUI:filePath];
    if (message) {
        hud.messageText = message;
    }
    [view addSubview:hud];
    [hud startAnimation];
    return hud;
}

+(HXBLoadingHUD *)showMessage:(NSString *)message toView:(UIView *)view
{
   return [self showMessage:message toView:view withGifFilePath:nil];
}

+(void)hideHUDForView:(UIView *)view
{
    for (UIView *hud in view.subviews) {
        if ([hud isKindOfClass:[HXBLoadingHUD class]]){
            [((HXBLoadingHUD*)hud) stopAnimationWithmessageText:@"加载成功..." withType:YES];
        }
    }
}

+(HXBLoadingHUD *)showCommonMessage:(NSString *)message toView:(UIView *)view
{
    HXBLoadingHUD *hud = [[HXBLoadingHUD alloc]initWithFrame:view.bounds];
    if (message) {
        hud.messageText = message;
    }
    [view addSubview:hud];
    [hud startCommon];
    return hud;
}

+(void)hideCommonHUDForView:(UIView *)view
{
    for (UIView *hud in view.subviews) {
        if ([hud isKindOfClass:[HXBLoadingHUD class]]){
            [((HXBLoadingHUD*)hud) stopCommon];
        }
    }
}

-(void)showSuccessWithIcon:(NSString *)icon
{
    [_loadingGifview stopGif];
    _loadingGifview.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:icon].CGImage);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

#pragma mark-------加载动画gif

-(UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(_loadingGifview.x-20, _loadingGifview.y-10, _loadingGifview.width+40, _loadingGifview.height+self.infolabel.height+10)];
        _bgView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        _bgView.layer.cornerRadius = 5;
        _bgView.clipsToBounds = YES;
        _bgView.hidden = YES;
    }
    return _bgView;
}

//加载动画
-(void)creatAnimationUI:(NSString*)gifFilePath
{
    self.backgroundColor = [UIColor clearColor];
    NSString *path = gifFilePath?gifFilePath:[[NSBundle mainBundle] pathForResource:@"loading" ofType:@"gif"];
    UIImage *image = [UIImage imageNamed:path];
    CGSize imageSize = image.size;
    
    _loadingGifview = [[GifView alloc] initWithFrame:CGRectMake(self.width/2-imageSize.width/4,self.height/2-imageSize.height/4-40, imageSize.width/2,imageSize.height/2) filePath:path];
    _isAnimating = NO;
    [self addSubview:self.bgView];
    
    [self addSubview:_loadingGifview];
    [self addSubview:self.infolabel];

/*
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width/2-40,self.height/2-40-15, 80,80)];
    //        imageView.center = self.superview.center;
    [self addSubview:_imageView];
    //设置动画帧
    _imageView.animationImages=[NSArray arrayWithObjects: [UIImage imageNamed:@"1HUD"],
                                [UIImage imageNamed:@"2HUD"],
                                [UIImage imageNamed:@"3HUD"],
                                [UIImage imageNamed:@"4HUD"],
                                [UIImage imageNamed:@"5HUD"],
                                [UIImage imageNamed:@"6HUD"],
                                nil ];
*/
    self.layer.hidden = YES;
}
//动画运行
- (void)startAnimation
{
    _isAnimating = YES;
    self.layer.hidden = NO;
    [self doAnimation];
}

-(void)doAnimation{
    
    self.infolabel.text = _messageText?_messageText:@"努力加载中...";
//    //设置动画总时间
//    _imageView.animationDuration=1.0;
//    //设置重复次数,0表示不重复
//    _imageView.animationRepeatCount=0;
//    //开始动画
//    [_imageView startAnimating];
}
//隐藏界面
- (void)stopAnimationWithmessageText:(NSString *)text withType:(BOOL)type;
{
    _isAnimating = NO;
    self.infolabel.text = text;
    if (self.loadingGifview) {
        [self.loadingGifview stopGif];
    }
    self.layer.hidden = YES;
    [self removeFromSuperview];
/*
    if(type){
        [UIView animateWithDuration:0.3f animations:^{
            self.alpha = 0;
        } completion:^(BOOL finished) {
            [_imageView stopAnimating];
            self.layer.hidden = YES;
            [self removeFromSuperview];
        }];
    }else{
        [_imageView stopAnimating];
        [_imageView setImage:[UIImage imageNamed:@"3"]];
        self.hidden = YES;
        [self removeFromSuperview];
    }
*/
}

-(void)setMessageText:(NSString *)messageText
{
    if(messageText){
        _messageText = messageText;
    }
}

#pragma mark-------加载菊花怪
-(UIActivityIndicatorView *)activeView
{
    if (!_activeView) {
        self.backgroundColor = [UIColor clearColor];
        _activeView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(self.width/2-5, self.height/2-5, 10, 10)];
        _activeView.color = [UIColor yellowColor];
        //    _activeView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        _activeView.hidesWhenStopped = YES;
        [self addSubview:_activeView];
    }
    return _activeView;
}
-(UILabel *)infolabel
{
    if (!_infolabel) {
        _infolabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height/2+5, self.width, 20)];
        _infolabel.backgroundColor = [UIColor clearColor];
        _infolabel.textAlignment = NSTextAlignmentCenter;
        _infolabel.font = [UIFont systemFontOfSize:14.0f];
        _infolabel.hidden = YES;
//        [self addSubview:_infolabel];
    }
    return _infolabel;
}

-(void)startCommon
{
    self.backgroundColor = [UIColor clearColor];
    [self.activeView startAnimating];
    [self addSubview:self.infolabel];
    self.infolabel.text = self.messageText?self.messageText:@"努力加载中...";
    self.infolabel.textColor = kBlackMainColor;
}
-(void)stopCommon
{
    [self.activeView stopAnimating];
    self.hidden = YES;
    [self removeFromSuperview];
}


@end
