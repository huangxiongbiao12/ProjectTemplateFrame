//
//  PostFatherVC.m
//  NingApartment
//
//  Created by 黄雄彪 on 17/2/23.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "PostFatherVC.h"
#import "ShareCell.h"


@interface PostFatherVC ()

@end

@implementation PostFatherVC

- (instancetype)init
{
    self = [super init];
    if (self) {
//        NSArray *arr = @[@"http://imgsrc.baidu.com/forum/w%3D580/sign=9b0ec7fbb11bb0518f24b320067bda77/497a96a20cf431adf99688e04936acaf2cdd98f5.jpg",@"http://imgsrc.baidu.com/forum/pic/item/794fcb78918c5f5c908f9d1d.jpg",@"http://img1.cache.netease.com/catchpic/8/87/872BE5A4105389DD4532DEF982A50848.jpg",@"http://s10.sinaimg.cn/bmiddle/5e458b6dh6b7ae63b5809&690",@"http://s10.sinaimg.cn/bmiddle/5e458b6dh6b7ae63b5809&690",@"http://imgsrc.baidu.com/forum/w%3D580/sign=9b0ec7fbb11bb0518f24b320067bda77/497a96a20cf431adf99688e04936acaf2cdd98f5.jpg",@"http://img3.imgtn.bdimg.com/it/u=3152217596,1256270477&fm=21&gp=0.jpg",@"http://img5.imgtn.bdimg.com/it/u=4155302816,1201715785&fm=21&gp=0.jpg",@"http://img3.imgtn.bdimg.com/it/u=3843979064,1483327667&fm=21&gp=0.jpg",@"http://img.taopic.com/uploads/allimg/131113/235002-13111309532260.jpg"];
        NSArray *arr = @[@"img_nczj_1",@"img_nczj_1",@"img_nczj_1",@"img_nczj_1",@"img_nczj_1",@"img_nczj_1",@"img_nczj_1",@"img_nczj_1",@"img_nczj_1",@"img_nczj_1"];
        for (int i = 0; i < 10; i++) {
            ShareItem *item = [ShareItem new];
            item.iconStr = @"img_nczj_tx";
            item.nickName = @"小猫腻";
            item.time = @"两小时前";
            item.adress = @"北部软件园店";
            item.content = @"宁巢公寓真是棒啊！";
            item.source = @"【帖子】";
            if (i%3==0) {
                item.isHelp = YES;
                item.helpNum = @"10";
                item.helpAdress = @"泰嘉园";
                item.helpTime = @"2017-07-02";
                item.person = @"刘德华、周杰伦、周星驰";
            }
            for (int j = 0; j < i%5; j++) {
                [item.imageUrlArr addObject:arr[j]];
            }
            [self.dataArr addObject:item];
        }
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

#pragma mark-------ShareCellDelegate


-(void)clickMessageWithMessageId:(NSString *)messageId type:(ShareCellActionType)actionType
{
    if (actionType==ShareCellActionTypePraise) {
        
    }else if (actionType==ShareCellActionTypeComment){
        
    }
}



#pragma mark-------

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShareCell"];
    if (!cell) {
        cell = [[ShareCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ShareCell"];
    }
    cell.item = self.dataArr[indexPath.section];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataArr[indexPath.section] cellHeight];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}

@end
