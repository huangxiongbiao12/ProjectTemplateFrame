//
//  ShareCell.m
//  HotelClient
//
//  Created by 黄雄彪 on 16/10/8.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import "ShareCell.h"

@interface ShareCell ()
{
    UIImageView *_iconImageView;
    UILabel *_nickLabel;
    UILabel *_timeLabel;
    UILabel *_adressLabel;
}
@property(nonatomic,strong)UIButton *nickBtn;
@property(nonatomic,strong)UILabel *contentLabel;

@property(nonatomic,strong)UIView *toolBar;
@property(nonatomic,strong)UILabel *sourceLabel;
@property(nonatomic,strong)UILabel *sourceLabel1;
@property(nonatomic,strong)UIButton *commentBtn;
@property(nonatomic,strong)UIButton *colletionBtn;
@property(nonatomic,strong)UIButton *praiseBtn;
@property(nonatomic,strong)UIButton *moreBtn;

@property(nonatomic,strong)UIView *helpView;
//==
@property(nonatomic,strong)UILabel *helpTimeLabel;//活动时间
@property(nonatomic,strong)UILabel *helpAdressLabel;//活动地点
@property(nonatomic,strong)UILabel *helpNumLabel;//活动人数
//==
@property(nonatomic,strong)UIView *helpPersonView;//参与人视图
@property(nonatomic,strong)UILabel *personLabel;
@property(nonatomic,strong)UIButton *joinBtn;//报名

@property(nonatomic,strong)UILabel *moreLabel;
@property(nonatomic,strong)NSMutableArray *imageArr;

@end

@implementation ShareCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _imageArr = [NSMutableArray array];
//        个人信息
        _nickBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nickBtn.x = 10;
        _nickBtn.y = 10;
        _nickBtn.height = 40;
        _nickBtn.width = kScreenWidth-20;
        [self.contentView addSubview:_nickBtn];
        
        _nickBtn.enabled = NO;
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 30, 30)];
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = 15;
        [_nickBtn addSubview:imageView];
        _iconImageView = imageView;
        _nickLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, kScreenWidth-50, 20)];
        _nickLabel.font = [UIFont systemFontOfSize:15];
        _nickLabel.textColor = kBlackMainColor;
        [_nickBtn addSubview:_nickLabel];
        _adressLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 20, kScreenWidth-50, 20)];
        _adressLabel.font = [UIFont systemFontOfSize:12];
        _adressLabel.textColor = kTitleGrayColor;
        [_nickBtn addSubview:_adressLabel];
        
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-110, 0, 90, 20)];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = kTitleGrayColor;
        [_nickBtn addSubview:_timeLabel];
        
        UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(10, _nickBtn.maxY+10, kScreenWidth-10, 1)];
        lineView.backgroundColor = kLineMainColor;
        [self.contentView addSubview:lineView];
        
//        发布的内容
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.x = 10;
        _contentLabel.width = kScreenWidth - 20;
        _contentLabel.y = _nickBtn.maxY+25;
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        _contentLabel.textColor = kBlackMainColor;
        [self.contentView addSubview:_contentLabel];
        
//        点赞评论
        CGFloat w = kScreenWidth/4;
        CGFloat h = 0;
        _toolBar = [UIView new];
        _toolBar.x = 0;
        _toolBar.width = kScreenWidth;
        _toolBar.height = h+40;
        [self.contentView addSubview:_toolBar];
        
//        _sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
//        _sourceLabel.text = @"来自";
//        _sourceLabel.textColor = SHColor(79, 79, 79);
//        _sourceLabel.font = [UIFont systemFontOfSize:13];
//        _sourceLabel.textAlignment = NSTextAlignmentCenter;
//        
//        _sourceLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 200, 20)];
//        _sourceLabel1.text = @"帖子";
//        _sourceLabel1.textColor = kRedTitleColor;
//        _sourceLabel1.font = [UIFont systemFontOfSize:13];
        
        _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _praiseBtn.frame = CGRectMake(0, h, w, 40);
        [_praiseBtn setTitleColor:kBlackMian1Color forState:UIControlStateNormal];
        [_praiseBtn setImage:[UIImage imageNamed:@"icon_nczj_dz"] forState:UIControlStateNormal];
        [_praiseBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [_praiseBtn setImage:[UIImage imageNamed:@"icon_fx_dz_h"] forState:UIControlStateSelected];
        //        [_praiseBtn setTitle:@"" forState:UIControlStateNormal];
        _praiseBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_praiseBtn addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
        _praiseBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 2);
        _praiseBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, -2);
        
        _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _commentBtn.frame = CGRectMake(w, h, w, 40);
        [_commentBtn setTitleColor:kBlackMian1Color forState:UIControlStateNormal];
        [_commentBtn setImage:[UIImage imageNamed:@"icon_nczj_pj"] forState:UIControlStateNormal];
        [_commentBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [_commentBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
//        [_commentBtn setTitle:@"" forState:UIControlStateNormal];
        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_commentBtn addTarget:self action:@selector(commentAction:) forControlEvents:UIControlEventTouchUpInside];
        _commentBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 2);
        _commentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, -2);
        
        _colletionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _colletionBtn.frame = CGRectMake(w*2, h, w, 40);
        [_colletionBtn setTitleColor:kBlackMian1Color forState:UIControlStateNormal];
        [_colletionBtn setImage:[UIImage imageNamed:@"icon_nczj_sc"] forState:UIControlStateNormal];
        [_colletionBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [_colletionBtn setImage:[UIImage imageNamed:@"icon_nczj_sc_h"] forState:UIControlStateSelected];
        _colletionBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_colletionBtn addTarget:self action:@selector(colletionAction:) forControlEvents:UIControlEventTouchUpInside];
        _colletionBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 2);
        _colletionBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, -2);
        
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _moreBtn.frame = CGRectMake(kScreenWidth-w, h, w, 40);
        [_moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        [_moreBtn setTitleColor:kBlackMian1Color forState:UIControlStateNormal];
        [_moreBtn setImage:[UIImage imageNamed:@"icon_nczj_gd"] forState:UIControlStateNormal];
        [_moreBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [_moreBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
        //        [_commentBtn setTitle:@"" forState:UIControlStateNormal];
        _moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_moreBtn addTarget:self action:@selector(commentAction:) forControlEvents:UIControlEventTouchUpInside];
        _moreBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -2, 0, 2);
        _moreBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 2, 0, -2);
        
        [_toolBar addSubview:_sourceLabel];
        [_toolBar addSubview:_sourceLabel1];
        [_toolBar addSubview:_commentBtn];
        [_toolBar addSubview:_colletionBtn];
        [_toolBar addSubview:_praiseBtn];
        [_toolBar addSubview:_moreBtn];
    }
    return self;
}


#pragma mark-------评价、点赞

//评价、
-(void)colletionAction:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(clickMessageWithMessageId:type:)]) {
        [self.delegate clickMessageWithMessageId:nil type:ShareCellActionTypeCollection];
    }
}
//评价、
-(void)commentAction:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(clickMessageWithMessageId:type:)]) {
        [self.delegate clickMessageWithMessageId:nil type:ShareCellActionTypeComment];
    }
}
//点赞
-(void)praiseAction:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(clickMessageWithMessageId:type:)]) {
        [self.delegate clickMessageWithMessageId:nil type:ShareCellActionTypePraise];
    }
}
//浏览图片
-(void)scanImageAction:(UIButton*)btn
{
    if ([self.delegate respondsToSelector:@selector(scanPicture:clickPage:)]) {
        int i = 0;
        for (UIButton *button in _imageArr) {
            if (button==btn) {
                break;
            }
            i++;
        }
        [self.delegate scanPicture:self.item.imageUrlArr clickPage:i];
    }
}

#pragma mark-------
-(void)setItem:(ShareItem *)item
{
    _item = item;
    _iconImageView.image = [UIImage imageNamed:item.iconStr];
//    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:item.iconStr] placeholderImage:[UIImage imageNamed:@"icon_img_tx"]];
    _nickLabel.text = item.nickName;
    _timeLabel.text = item.time;
    _contentLabel.text = item.content;
    _adressLabel.text = item.adress;
    
    _sourceLabel1.text = item.source;
    [_commentBtn setTitle:item.commentNum.length?item.commentNum:@"0" forState:UIControlStateNormal];
    [_praiseBtn setTitle:item.praiseNum.length?item.praiseNum:@"0" forState:UIControlStateNormal];
    [_colletionBtn setTitle:item.collctionNum.length?item.collctionNum:@"0" forState:UIControlStateNormal];
//    _praiseBtn.enabled = [item.isPraise isEqualToString:@"1"]?YES:NO;
    
    _toolBar.y = item.cellHeight - _toolBar.height;
    CGSize size = [item.content boundingRectWithSize:CGSizeMake(kScreenWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
    _contentLabel.height = size.height;
    
    [self setImagesWithUrlsArr:item.imageUrlArr];//设置图片
    
    if (item.isHelp) {//存在活动
        self.helpView.hidden = NO;
        [self initHelpView];
    }else {
        _helpView.hidden = YES;
    }
}


-(void)setImagesWithUrlsArr:(NSArray*)urls
{
    for (int i = 0; i < urls.count; i++) {
        if (i==3) {
            UIButton *btn = _imageArr[2];
            self.moreLabel.frame = btn.bounds;
            [btn addSubview:self.moreLabel];
            return;
        }else{
            [self.moreLabel removeFromSuperview];
        }
        UIButton *imageBtn;
        if (_imageArr.count>i) {
            imageBtn = _imageArr[i];
            imageBtn.hidden = NO;
        }else{
            imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [imageBtn addTarget:self action:@selector(scanImageAction:) forControlEvents:UIControlEventTouchUpInside];
            imageBtn.hidden = NO;
            [_imageArr addObject:imageBtn];
        }
        imageBtn.frame = CGRectMake(10+i%3*((kScreenWidth-40)/3+10), _contentLabel.maxY+15, (kScreenWidth-40)/3, (kScreenWidth-40)/3);
//        [imageBtn sd_setImageWithURL:[NSURL URLWithString:urls[i]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"placeholder"]];
        [imageBtn setBackgroundImage:[UIImage imageNamed:urls[i]] forState:UIControlStateNormal];
//        [imageBtn sd_setBackgroundImageWithURL:urls[i] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"img_fx_zw"]];
         [self.contentView addSubview:imageBtn];
    }
    
    for (int i = 0; i < _imageArr.count; i++) {
        UIButton *btn = _imageArr[i];
        if (i >= urls.count) {
            btn.hidden = YES;
            [btn removeFromSuperview];
        }
    }
}

-(void)initHelpView {
     _helpView.y = _item.cellHeight-_toolBar.height-120;
    _helpTimeLabel.text = [NSString stringWithFormat:@"活动时间：%@",_item.helpTime];
    _helpAdressLabel.text = [NSString stringWithFormat:@"活动地点：%@",_item.helpAdress];
    _helpNumLabel.text = [NSString stringWithFormat:@"活动人数：%@",_item.helpNum];
    _personLabel.text = [NSString stringWithFormat:@"%@",_item.person];
}

#pragma mark-------

-(UILabel *)moreLabel
{
    if (!_moreLabel) {
        _moreLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        _moreLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _moreLabel.text = @"查看更多";
        _moreLabel.textAlignment = NSTextAlignmentCenter;
        _moreLabel.font = [UIFont systemFontOfSize:12];
        _moreLabel.textColor = [UIColor whiteColor];
        _moreLabel.numberOfLines = 0;
    }
    return _moreLabel;
}

-(UIView *)helpView {
    if (!_helpView) {
        _helpView = [[UIView alloc]initWithFrame:CGRectMake(0, _item.cellHeight-_toolBar.height-120, kScreenWidth, 120)];
        [self.contentView addSubview:_helpView];
        
        _helpTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 18)];
        _helpTimeLabel.font = kFont(12);
        _helpTimeLabel.textColor = kTitleGrayColor;
        [_helpView addSubview:_helpTimeLabel];
        
        _helpAdressLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _helpTimeLabel.maxY, kScreenWidth-20, 18)];
        _helpAdressLabel.font = kFont(12);
        _helpAdressLabel.textColor = kTitleGrayColor;
        [_helpView addSubview:_helpAdressLabel];
        
        _helpNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _helpAdressLabel.maxY, kScreenWidth-20, 18)];
        _helpNumLabel.font = kFont(12);
        _helpNumLabel.textColor = kTitleGrayColor;
        [_helpView addSubview:_helpNumLabel];
        
        _helpPersonView = [[UIView alloc]initWithFrame:CGRectMake(10, _helpNumLabel.maxY+10, kScreenWidth-20, 60)];
        _helpPersonView.backgroundColor = kBackgroundGrayDefautColor;
        [_helpView addSubview:_helpPersonView];
        UILabel *tips = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, 120, 15)];
        tips.textColor = kTitleGrayColor;
        tips.font = kFont(13);
        tips.text = @"参与人";
        [_helpPersonView addSubview:tips];
        _personLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 20, _helpPersonView.width-120, 35)];
        _personLabel.font = kFont(15);
        _personLabel.textColor = kBlackMainColor;
        [_helpPersonView addSubview:_personLabel];
        
        _joinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _joinBtn.frame = CGRectMake(_helpPersonView.width-110, 10, 100, 40);
        _joinBtn.backgroundColor = kNavBarMainColor;
        [_joinBtn setTitle:@"已过期" forState:UIControlStateDisabled];
        [_joinBtn setTitle:@"我的报名" forState:UIControlStateNormal];
        [_helpPersonView addSubview:_joinBtn];
    }
    return _helpView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
