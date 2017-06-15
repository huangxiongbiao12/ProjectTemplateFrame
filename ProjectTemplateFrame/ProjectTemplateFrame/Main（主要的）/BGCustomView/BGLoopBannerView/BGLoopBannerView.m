//
//  BGLoopBannerView.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/4/27.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "BGLoopBannerView.h"
#import "UIImageView+WebCache.h"

@interface BGLoopBannerView ()<UIScrollViewDelegate>
{
    //页码
    UIPageControl *_pageCtl;
    //轮播到第几张图片
    int _page;
    UIView *_incationTipsView;
}
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageCtl;
@property(nonatomic,strong)UILabel *pageLabel;
@property(nonatomic,strong)UIView *detailIncationView;
@end

//轮播时间间隔
#define postTime 3

@implementation BGLoopBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        self.scrollView.delegate = self;
        _page = 0;
        _timeLoop = 3;
        _isLoop = YES;
        _pageType = BGLoopBannerViewPageTypePageCtl;
    }
    return self;
}

#pragma mark-------UIScrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ((int)(scrollView.contentOffset.x/self.width)==0) {
        self.scrollView.contentOffset = CGPointMake(self.width*_itemArr.count, 0);
        
    }else if ((int)(scrollView.contentOffset.x/self.width)==(_itemArr.count+1)){
        self.scrollView.contentOffset = CGPointMake(self.width, 0);
        
    }
    _page = (int)(scrollView.contentOffset.x/self.width) - 1;
    [self changePicIndication];
}

#pragma mark-------设置图片内容
-(void)setItemArr:(NSArray *)itemArr
{
    _itemArr = itemArr;
    //设置新闻的具体属性
    self.scrollView.contentSize = CGSizeMake(self.width*(itemArr.count+2), 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentOffset = CGPointMake(self.width, 0);
    [self addSubview:self.scrollView];
    //shezhi指示器
    [self setPicIndication];
    if (itemArr.count<=1||!itemArr.count) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        NSString *imageName = itemArr.firstObject;
        if ([imageName containsString:@"http"]) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"img_loading_2"]];
        }else{
            imageView.image = [UIImage imageNamed:imageName];
        }
        if (!imageView.image) {
            imageView.image = [UIImage imageNamed:@"img_loading_2"];
        }
        [self.scrollView addSubview:imageView];
        self.scrollView.contentSize = CGSizeMake(self.width, 0);
        self.scrollView.contentOffset = CGPointMake(0, 0);
        return;
    }
    //    设置广告的图片
    for (NSInteger i = 0; i < itemArr.count + 2; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width*i, 0, self.width, self.height)];
        NSString *imageName;
        if (i==0) {
            imageName = [itemArr lastObject];
        }else if (i==itemArr.count+1){
            imageName = [itemArr firstObject];
        }else{
            imageName = itemArr[i-1];
        }
        if ([imageName containsString:@"http"]) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"img_loading_2"]];
        }else{
            imageView.image = [UIImage imageNamed:imageName];
        }
        if (!imageView.image) {
            imageView.image = [UIImage imageNamed:@"img_loading_2"];
        }
        [self.scrollView addSubview:imageView];
    }
    //    启动定时器
    if (_isLoop) {
        [NSTimer scheduledTimerWithTimeInterval:_timeLoop target:self selector:@selector(changePic:) userInfo:nil repeats:YES];
    }
}

//定时器触发
-(void)changePic:(NSTimer *)sender{
    _page++;
    if (_page == _itemArr.count) {
        _page = 0;
        //回到第一个视图
        self.scrollView.contentOffset= CGPointMake(0, 0);
    }
    //修改UIScrollView的偏移量
    //跳转到第二个视图
    [self.scrollView setContentOffset:CGPointMake(self.width * (_page+1), 0) animated:YES];
    [self changePicIndication];
}

#pragma mark-------privice 

-(void)setPicIndication {
    
    _pageLabel.hidden = YES;
    _pageCtl.hidden = YES;
    _detailIncationView.hidden = YES;
    
    if (_pageType==BGLoopBannerViewPageTypePageCtl) {
        //    设置总页数
        _pageCtl.hidden = NO;
        self.pageCtl.numberOfPages = _itemArr.count;
    }else if (_pageType==BGLoopBannerViewPageTypeLabel){
        _pageLabel.hidden = NO;
        self.pageLabel.centerX = self.width/2;
        self.pageLabel.y = self.height - 30;
        self.pageLabel.width = 50;
        self.pageLabel.height = 25;
        self.pageLabel.text = [NSString stringWithFormat:@"1/%ld",_itemArr.count];
        [self addSubview:self.pageLabel];
    }else if (_pageType==BGLoopBannerViewPageTypeDetail) {
        _detailIncationView.hidden = NO;
    }
}

-(void)changePicIndication {
    if (_pageType==BGLoopBannerViewPageTypePageCtl) {
        _pageCtl.currentPage = _page;
    }else if (_pageType==BGLoopBannerViewPageTypeLabel){
        self.pageLabel.text = [NSString stringWithFormat:@"%d/%ld",_page+1,_itemArr.count];
    }else if (_pageType==BGLoopBannerViewPageTypeDetail) {
        UIButton *desBtn = (UIButton*)[self viewWithTag:500+_page];
        _incationTipsView.centerX = desBtn.centerX;
    }
}

-(void)setDesItems:(NSArray<NSString *> *)desItems {
    _desItems = desItems;
    _pageType = BGLoopBannerViewPageTypeDetail;
    [self setPicIndication];
    for (int i = 0; i < desItems.count; i++) {
        UIButton *desBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        desBtn.frame = CGRectMake(i*kScreenWidth/desItems.count, 8, kScreenWidth/desItems.count, 36);
        desBtn.tag = 500+i;
        desBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [desBtn setTitle:desItems[i] forState:UIControlStateNormal];
        [self.detailIncationView addSubview:desBtn];
    }
    _incationTipsView.centerX = kScreenWidth/desItems.count/2;
}

-(void)setPageType:(BGLoopBannerViewPageType)pageType {
    _pageType = pageType;
    if (pageType==BGLoopBannerViewPageTypeLabel) {
        self.pageCtl.hidden = YES;
        self.pageLabel.hidden = NO;
        self.detailIncationView.hidden = YES;
    }else if (pageType==BGLoopBannerViewPageTypePageCtl) {
        self.pageCtl.hidden = NO;
        self.pageLabel.hidden = YES;
        self.detailIncationView.hidden = YES;
    }else if (pageType==BGLoopBannerViewPageTypeDetail) {
        self.pageCtl.hidden = YES;
        self.pageLabel.hidden = YES;
        self.detailIncationView.hidden = NO;
    }
}

#pragma mark-------设置基础属性,图片指示器

-(void)setPageFrame:(CGRect)pageFrame
{
    _pageFrame = pageFrame;
    self.pageCtl.frame = pageFrame;
}

-(UIPageControl *)pageCtl
{
    if (!_pageCtl) {
        //   显示页码的控件
        _pageCtl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height - 24, self.width, 24)];
        //设置当前页码的颜色
        _pageCtl.currentPageIndicatorTintColor = SHColor(159, 234, 225);
        //    设置其他页码的颜色
        _pageCtl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageCtl.currentPage = _page;
        [self addSubview:_pageCtl];
        [_pageLabel removeFromSuperview];
    }
    return _pageCtl;
}
-(UILabel *)pageLabel
{
    if (!_pageLabel) {
        _pageLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.width/2-25, self.height-30, 50, 25)];
        _pageLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _pageLabel.textAlignment = NSTextAlignmentCenter;
        _pageLabel.font = [UIFont systemFontOfSize:15];
        _pageLabel.textColor = [UIColor whiteColor];
        _pageLabel.layer.cornerRadius = 12.5;
        _pageLabel.clipsToBounds = YES;
        [self addSubview:_pageLabel];
        //        [_pageCtl removeFromSuperview];
    }
    return _pageLabel;
}

-(UIView *)detailIncationView {
    if (!_detailIncationView) {
        _detailIncationView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height-44, kScreenWidth, 44)];
        _detailIncationView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self addSubview:_detailIncationView];
        _incationTipsView = [[UIView alloc]initWithFrame:CGRectMake(0, 8, 4, 4)];
        _incationTipsView.backgroundColor = [UIColor whiteColor];
        _incationTipsView.layer.cornerRadius = 2;
        [_detailIncationView addSubview:_incationTipsView];
    }
    return _detailIncationView;
}


@end
