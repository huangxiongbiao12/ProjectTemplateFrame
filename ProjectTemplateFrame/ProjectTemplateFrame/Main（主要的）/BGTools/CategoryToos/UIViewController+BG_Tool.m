//
//  UIViewController+BG_Tool.m
//  ProjectTemplateFrame
//
//  Created by 黄雄彪 on 2017/6/20.
//  Copyright © 2017年 sihan. All rights reserved.
//

#import "UIViewController+BG_Tool.h"

@implementation UIViewController (BG_Tool)

static char NavBarOrigTitleKey;

- (void)setNavBarOrigTitle:(NSString *)navBarOrigTitle {
    objc_setAssociatedObject(self, &NavBarOrigTitleKey, navBarOrigTitle, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)navBarOrigTitle {
    return objc_getAssociatedObject(self, &NavBarOrigTitleKey);
}

static char NavBarIsLoadingKey;
- (void)setIsLoading:(BOOL)isLoading {
    objc_setAssociatedObject(self, &NavBarIsLoadingKey, @(isLoading), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isLoading {
    return [objc_getAssociatedObject(self, &NavBarIsLoadingKey) boolValue];
}

- (void)startLoading {
    if (!self.isLoading) {
        self.navBarOrigTitle = self.title;
        UIView *navBarLoadingContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        self.navigationItem.titleView = navBarLoadingContainer;
        self.isLoading = YES;
        
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicator.center = CGPointMake(11, navBarLoadingContainer.centerY);
        [activityIndicator startAnimating];
        
        UILabel *loadingTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(activityIndicator.maxX+5, 0, navBarLoadingContainer.width-30, navBarLoadingContainer.height)];
        loadingTitleLabel.textAlignment = NSTextAlignmentCenter;
        loadingTitleLabel.textColor = [UIColor blackColor];
        loadingTitleLabel.text = @"加载中...";
        
        [navBarLoadingContainer addSubview:loadingTitleLabel];
        [navBarLoadingContainer addSubview:activityIndicator];
        
    }
}

- (void)stopLoading {
    if (self.isLoading) {
        self.navigationItem.titleView = nil;
        self.title = self.navBarOrigTitle;
        self.isLoading = NO;
    }
}

@end
