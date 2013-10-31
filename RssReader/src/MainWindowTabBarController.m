//
//  MainWindowTabBarController.m
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "MainWindowTabBarController.h"

@interface MainWindowTabBarController ()

//@property (strong)  NewsFromInternetViewController* newsFromInternet;
//@property (strong)  OptionsViewController* fontOptions;
//@property (strong) FavoriteNewsViewController* newsFromData;

@end

@implementation MainWindowTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self.navigationController presentViewController:[LoginWindowViewController new] animated:YES completion:^{}];
    //self.navigationController.navigationBarHidden = YES;
    
    UINavigationController* newsFromData = [[UINavigationController alloc] initWithRootViewController:[FavoriteNewsViewController new]];
    UINavigationController* newsFromInternet = [[UINavigationController alloc] initWithRootViewController:[NewsFromInternetViewController new]];
    UINavigationController* fontOptions = [[UINavigationController alloc] initWithRootViewController:[OptionsViewController new]];
    
    
    //self.newsFromData = [[UINavigationController alloc] initWithRootViewController:[FavoriteNewsViewController new]];
    //self.newsFromInternet = [[UINavigationController alloc] initWithRootViewController:[NewsFromInternetViewController new]];
    //self.fontOptions = [[UINavigationController alloc] initWithRootViewController:[OptionsViewController new]];
  
    NSArray* arrayOfViews = [NSArray arrayWithObjects:newsFromInternet, newsFromData,fontOptions, nil];
    [self setViewControllers:arrayOfViews];

    
}






@end
