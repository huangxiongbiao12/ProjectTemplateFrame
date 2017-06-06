//
//  ScanPictureView.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/6/29.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "ScanPictureView.h"

@interface ScanPictureView ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UILabel *tipsLabel;

@end

@implementation ScanPictureView


+(ScanPictureView*)viewWithImageArr:(NSArray*)imageArr
{
    ScanPictureView *scan = [[ScanPictureView alloc] init];
    scan.imageArr = imageArr;
    scan.page = 1;
    return scan;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kScreenHeight/6, kScreenWidth, kScreenHeight*2/3)];
        _scrollView.pagingEnabled = YES;
        _scrollView .backgroundColor = [UIColor whiteColor];
        _scrollView.delegate = self;
        [self addSubview:_scrollView];
        _tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kScreenHeight/6-30, kScreenWidth, 30)];
        _tipsLabel.textColor = [UIColor whiteColor];
        _tipsLabel.font = [UIFont systemFontOfSize:15];
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipsLabel];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideScanView)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

-(void)hideScanView
{
    [self removeFromSuperview];
}

-(void)setImageArr:(NSArray *)imageArr
{
    _imageArr = imageArr;
    for (UIView *view in _scrollView.subviews) {
        [view removeFromSuperview];
    }
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*imageArr.count, 0);
    for (int i = 0; i < imageArr.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i*kScreenWidth, 0, kScreenWidth, self.scrollView.height);
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageArr[i]] placeholderImage:[UIImage imageNamed:@"img_fx_zw"]];
        [_scrollView addSubview:imageView];
    }
}
-(void)setPage:(int)page
{
    _page = page;
    _scrollView.contentOffset = CGPointMake(page*kScreenWidth, 0);
    _tipsLabel.text = [NSString stringWithFormat:@"%d/%ld",page+1,_imageArr.count];
}

#pragma mark-------UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.page = scrollView.contentOffset.x/kScreenWidth;
}

@end
