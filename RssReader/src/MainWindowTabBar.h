//
//  MainWindowTabBar.h
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewWithFavoritesNews.h"
#import "ViewWithNews.h"
#import "ViewWithOptions.h"

@protocol MainWindowTabBarDelegate <NSObject>



@end

@interface MainWindowTabBar : UITabBar

@property (nonatomic, weak) id<MainWindowTabBarDelegate> delegate;

@end
