//
//  OpenNewsViewController.h
//  1
//
//  Created by fgf_1 on 23.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OpenNewsView.h"
#import "TBXML.h"
#define DOCUMENTS [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

@interface OpenNewsViewController : UIViewController

@property (strong)  OpenNewsView* openNewsView;
@property (strong)  NSDictionary* newsItem;
@property (nonatomic, assign)  BOOL hideFavoriteButton;

@end
