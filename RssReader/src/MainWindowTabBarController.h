//
//  MainWindowTabBarController.h
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsViewController.h"
#import "FavoriteNewsViewController.h"
#import "NewsFromInternetViewController.h"
#import "LoginWindowViewController.h"

@interface MainWindowTabBarController : UITabBarController

@property (strong)  NSString* currentLogin;
@property (strong)  NSString* currentPassword;

@end
