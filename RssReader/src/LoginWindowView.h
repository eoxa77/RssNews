//
//  LoginWindowView.h
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainWindowTabBarController.h"

@protocol LoginWindowViewDelegate <NSObject>

-(void) loginInToApplication: (UIView *) view WithLogin:(NSString*) login AndPassword:(NSString*) password;

@end

@interface LoginWindowView : UIView

@property (nonatomic, weak) id <LoginWindowViewDelegate> delegate;

@end
