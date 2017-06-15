//
//  ShareCell.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/10/8.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareItem.h"

typedef NS_ENUM(NSInteger,ShareCellActionType) {
    ShareCellActionTypePraise,
    ShareCellActionTypeCollection,
    ShareCellActionTypeComment
};


@protocol ShareCellDelegate <NSObject>

-(void)scanPicture:(NSArray*)imageArr clickPage:(int)page;
-(void)clickMessageWithMessageId:(NSString *)messageId type:(ShareCellActionType)actionType;

@end

@interface ShareCell : UITableViewCell

@property(nonatomic,strong)ShareItem *item;
@property(nonatomic,weak) id<ShareCellDelegate> delegate;


@end
