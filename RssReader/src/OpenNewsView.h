//
//  OpenNewsView.h
//  1
//
//  Created by fgf_1 on 23.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface OpenNewsView : UIView



@property (nonatomic, weak) NSString* link;
@property (strong)  IBOutlet UIWebView* web;

//@property (strong)  UITextView* titleOfNews;

@end
