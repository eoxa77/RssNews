//
//  LoginWindowViewController.m
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "LoginWindowViewController.h"
#import "AppDelegate.h"
@interface LoginWindowViewController ()<LoginWindowViewDelegate>

@property (strong)  LoginWindowView* loginWindowView;

@end

@implementation LoginWindowViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.navigationController.navigationBarHidden=YES;
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:nil forKey:@"firstStart"];
    //NSString* isFirstStart = [userDefaults objectForKey:@"firstStart"];
        
    self.navigationController.navigationBar.translucent = NO;
    
    self.loginWindowView = [[LoginWindowView alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:_loginWindowView];
    self.loginWindowView.delegate = self;
    self.loginWindowView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

}

-(void) loginInToApplication:(UIViewController *)viewController WithLogin:(NSString *)login AndPassword:(NSString *)password
{
    BOOL allRight = [login isEqualToString:@""] && [password isEqualToString:@""];
    allRight = !allRight;
    if ([login isEqualToString:@""]) {
        
        UIAlertView* loginIsEmpty = [[UIAlertView alloc] initWithTitle:@"LoginIsEmpty" message:@"Pls, enter your login" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [loginIsEmpty show];
        
        [self.loginWindowView addSubview:loginIsEmpty];
        
        return;
    }
    if ([password isEqualToString:@""]) {
        
        UIAlertView* passwordIsEmpty = [[UIAlertView alloc] initWithTitle:@"PasswordIsEmpty" message:@"Pls, enter your password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [passwordIsEmpty show];
        
        [self.loginWindowView addSubview:passwordIsEmpty];
        return;
    }
    if (allRight) {
        NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:@"NO" forKey:@"firstStart"];
        [userDefaults setObject:login forKey:@"Login"];
        [userDefaults setObject:password forKey:@"Password"];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    
}

@end
