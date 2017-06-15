//
//  SimpleAnimationButtomVC.m
//  BGCustomView
//
//  Created by 黄雄彪 on 2017/6/15.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "SimpleAnimationButtomVC.h"
#import "BGOpenDoorBtn.h"
#import "UIView+BG_Tool.h"

@interface SimpleAnimationButtomVC ()
{
    int _time;//倒计时
    UIButton *_openBtn;
    UILabel *_timeLabel;
}
@end

@implementation SimpleAnimationButtomVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    BGOpenDoorBtn *openDoor = [BGOpenDoorBtn buttonWithType:UIButtonTypeCustom];
    openDoor.size = openDoor.currentImage.size;
    openDoor.center = CGPointMake(self.view.width/2, self.view.height/2);
    [self.view addSubview:openDoor];
    [openDoor addTarget:self action:@selector(openDoorAction:) forControlEvents:UIControlEventTouchUpInside];
    _openBtn = openDoor;
    
    _timeLabel = [[UILabel alloc]initWithFrame:openDoor.bounds];
    _timeLabel.y = 10;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.font = [UIFont systemFontOfSize:22];
    _timeLabel.hidden = YES;
    [openDoor addSubview:_timeLabel];
}


#pragma mark-------开门相关

-(void)openDoorAction:(BGOpenDoorBtn*)btn {
    [btn animationStart];
    btn.enabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(12 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [btn animationEnd];
    });
    [self startOpenAction];
}

-(void)startOpenAction {
    _time = 12;
    _timeLabel.hidden = NO;
    _timeLabel.text = [NSString stringWithFormat:@"%d s",_time];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeCount:) userInfo:nil repeats:YES];
    [timer fire];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)timeCount:(NSTimer*)timer {
    _timeLabel.hidden = NO;
    _timeLabel.text = [NSString stringWithFormat:@"%d s",_time];
    if (_time<=0) {
        _openBtn.enabled = YES;
        _timeLabel.hidden = YES;
        [timer invalidate];
    }
    _time--;
}


@end
