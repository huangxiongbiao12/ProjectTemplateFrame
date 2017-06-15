//
//  BGOpenDoorBtn.m
//  NingApartment
//
//  Created by 黄雄彪 on 2017/6/6.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "BGOpenDoorBtn.h"

@interface BGOpenDoorBtn ()
{
    NSTimer *_timer;
}
@property (nonatomic, assign) CGFloat radius;
@property(nonatomic, assign) CGFloat arcLineWith;
//圆环中心坐标
@property(nonatomic, assign) CGPoint arcLayerCenter;
@property (nonatomic, assign) CGFloat number;

@end

@implementation BGOpenDoorBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"btn_icon_km"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"icon_km_close"] forState:UIControlStateDisabled];
        _arcLineWith = 10;
        _radius = self.currentImage.size.height/2-5;
        _arcLayerCenter = CGPointMake(self.currentImage.size.height/2, self.currentImage.size.height/2);
    }
    return self;
}


#pragma mark-------
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //画进入环
    [self drawProgressLayer];
}


- (void)drawProgressLayer
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, self.radius / 10.0);
    CGContextSetRGBStrokeColor(ctx, 255.0/255.0, 10/255.0, 10/255.0, 1);
    CGContextSetLineWidth(ctx, self.arcLineWith);
    CGFloat end = - 1 * M_PI_2 + (4 * M_PI_2 * self.number);
    CGContextAddArc(ctx, _arcLayerCenter.x, _arcLayerCenter.y, self.radius, - 1 * M_PI_2, end, 0);
    CGContextStrokePath(ctx);
}

#pragma mark-------

-(void)animationStart {
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        self.number += 0.1;
        if (self.number>=1) {
            self.number=0;
        }
        [self setNeedsDisplay];
    }];
    
}

-(void)animationEnd {
    self.number=0;
    [self setNeedsDisplay];
    [_timer invalidate];
}

@end
