//
//  BGViewFactory.h
//  BGTools
//
//  Created by 黄雄彪 on 2017/6/13.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BGViewFactory : NSObject

/**
 *  生产普通的tableView
 *
 *  @return tableView
 */
+(UITableView*)creatTableViewDelegate:(id)delegate;
+(UITableView *)creatTableViewGroupDelegate:(id)delegate;
/**
 *  创建尾部按钮
 *
 *  @param action 点击时间返回
 *
 *  @return 返回尾部师徒
 */
+(UIView*)creatTableFooterBtnTitle:title Target:(id)target action:(SEL)action;

+(UIView*)createLineView:(CGRect)frame;


@end
