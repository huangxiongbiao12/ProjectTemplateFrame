//
//  ShowImageCollectionView.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/5/26.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShowImageCollectionViewDelegate <NSObject>

-(void)showImageViewdidSelectPhotos:(NSArray*)photos;

@end

@interface ShowImageCollectionView : UIView
+(ShowImageCollectionView*)viewWithFrame:(CGRect)frame viewController:(UIViewController*)viewController delegate:(id<ShowImageCollectionViewDelegate>)delegate;
@property(nonatomic,strong)NSMutableArray *selectedPhotos;
@property(nonatomic,strong)NSMutableArray *selectedAssets;
@property(nonatomic,strong)UILabel *imageNumLabel;
@end
