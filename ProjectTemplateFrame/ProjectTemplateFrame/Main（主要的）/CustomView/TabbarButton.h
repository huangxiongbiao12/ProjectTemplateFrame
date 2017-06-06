//
//  TabbarButton.h
//  HotelClient
//
//  Created by 黄雄彪 on 16/4/29.
//  Copyright © 2016年 sihan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabbarButton : UIButton

+(TabbarButton*)buttonWithTitle:(NSString*)title imageName:(NSString*)imageName;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)UIImage *image;
@property (strong, nonatomic) IBOutlet UILabel *titleLabelCustom;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewCustom;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *intervalHeight;

@end
