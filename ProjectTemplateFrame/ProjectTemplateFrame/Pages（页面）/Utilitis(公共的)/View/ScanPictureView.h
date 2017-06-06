//
//  ScanPictureView.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/6/29.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanPictureView : UIView

+(ScanPictureView*)viewWithImageArr:(NSArray*)imageArr;
@property(nonatomic,strong)NSArray *imageArr;
@property(nonatomic,assign)int page;

@end
