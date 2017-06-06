//
//  BGPickView.h
//  HotelManager
//
//  Created by 黄雄彪 on 16/8/29.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGPickView;

@protocol BGPickViewDelegate <NSObject>

@optional
-(void)pickClick:(BGPickView *)pickView resultString:(NSString *)resultString;
-(void)pickCancelClick:(BGPickView *)pickView;

@end


@interface BGPickView : UIView
@property(nonatomic,weak) id<BGPickViewDelegate> delegate;
@property(nonatomic,assign)NSInteger selectNum;//选中第几个元素
@property(nonatomic,assign)NSInteger showY;//显示的位置
@property(nonatomic,copy)NSString *selectString;//现在选中的是哪一个字符串
@property(nonatomic,strong)NSArray *dataArr;//数据元,刷新ui 

/**
 *  通过plistName添加一个pickView
 *
 *  @param array              需要显示的数组
 *  @param isHaveNavControler 是否在NavControler之内
 *
 *  @return 带有toolbar的pickview
 */
-(instancetype)initPickviewWithArray:(NSArray *)array selectString:(NSString*)selectString;

/**
 *   移除本控件
 */
-(void)remove;
/**
 *  显示本控件
 */
-(void)show;
/**
 *  显示本控件
 */
-(void)showInView:(UIView*)view;
/**
 *  设置PickView的颜色
 */
-(void)setPickViewColer:(UIColor *)color;

@end
