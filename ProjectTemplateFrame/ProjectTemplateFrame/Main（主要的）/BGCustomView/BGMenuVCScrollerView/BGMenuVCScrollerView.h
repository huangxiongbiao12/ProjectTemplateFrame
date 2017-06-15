//
//  BGMenuVCScrollerView.h
//  BGMenuVCScrollerView
//
//  Created by 黄雄彪 on 2017/6/9.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGMenuFatherVC.h"

@interface BGMenuVCScrollerViewItem : NSObject
//  设置控制器的名称和对用的菜单名字
+(BGMenuVCScrollerViewItem*)itemWithTitle:(NSString*)title viewControllerName:(NSString*)viewControllerName;
//  菜单名
@property(nonatomic,copy)NSString *title;
//  控制器必须继承   BGMenuFatherVC
@property(nonatomic,copy)NSString *viewControllerName;
@end

@interface BGMenuVCScrollerView : UIView
//  设置菜单名称和控制器数组，viewController是当前页面属于的控制器
+(BGMenuVCScrollerView*)viewWithItems:(NSArray<BGMenuVCScrollerViewItem*>*)items viewController:(UIViewController*)viewController;
@property(nonatomic,assign)CGFloat viewHight;//控制器界面显示高度
@property(nonatomic,assign)int selectIndex;//当前滑动到第几个vc
@property(nonatomic,strong)NSMutableArray *itemVcs;//控制器数组
@property(nonatomic,strong)UIColor *selectColor;//选中的颜色默认是导航颜色
@property(nonatomic,assign)BOOL awaysLoadData;//YES滑动的时候每次都加载数据，NO的时候只有没有数据的时候才加载，默认为NO
@property(nonatomic,assign)CGFloat originY;//界面展示的位置默认为64

@end
