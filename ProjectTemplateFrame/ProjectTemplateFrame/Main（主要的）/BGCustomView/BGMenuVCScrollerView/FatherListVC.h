//
//  FatherListVC.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/6/30.
//  Copyright © 2016年 sihan. All rights reserved.
//

/**
 *  封装刷新，没数据时的底部视图
 *  用法：继承于该类，调用下面方法
 *  自己实现数据加载方法
 */

#import <UIKit/UIKit.h>

@interface FatherListVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
}
@property (assign, nonatomic)NSInteger page; //!< 数据页数.表示下次请求第几页的数据.
@property(nonatomic,strong)UITableView *tableView;//列表
@property(nonatomic,strong)NSMutableArray *dataArr;//列表数据元
@property(nonatomic,assign)BOOL isSetRefresh;//是否设置刷新分页,默认又刷新分页
-(void)setBackgroundImageName:(NSString*)imageName tips:(NSString*)tips;//设置背景及名称
-(void)backgroundButtonAction;//背景按钮的触发方法
- (void)updateData;//数据刷新
-(void)updateView;//刷新界面（注意：使用背景时必须使用该方法刷新界面）
@end
