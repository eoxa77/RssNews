//
//  OpenNewsView.m
//  1
//
//  Created by fgf_1 on 23.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "OpenNewsView.h"

@interface OpenNewsView()<UIWebViewDelegate>


@property (strong)  UIView* topBar;
@property (nonatomic, strong) IBOutlet UIActivityIndicatorView* loadingWeb;


@end

@implementation OpenNewsView

@synthesize loadingWeb;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.loadingWeb = [UIActivityIndicatorView new]; //initWithFrame:CGRectMake(50, 0, 30, 30)];
        [self sendSubviewToBack:self.loadingWeb];
        self.loadingWeb.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        //_loadingWeb.hidden=NO;
        //_loadingWeb.backgroundColor = [UIColor redColor];
        [self addSubview:self.loadingWeb];
        
       
        self.web = [UIWebView new];
        
        self.topBar = [UIView new];
        _web.delegate = self;
        
        
        //self.titleOfNews = [UITextView new];
        //[_titleOfNews setUserInteractionEnabled:NO];
        //_titleOfNews.textAlignment = UITextAlignmentCenter;
        
        //[self addSubview:_topBar];
        //[self addSubview:_titleOfNews];
        //[self addSubview:_web];
       // [self addSubview:_backButton];
        //[self addSubview:_toFavoriteButton];
        //[self bringSubviewToFront:_titleOfNews];
        //[self bringSubviewToFront:_titleOfNews];
        
    }
    return self;
}

-(void) webViewDidStartLoad:(UIWebView*) webView
{
    [self.loadingWeb startAnimating];
    self.loadingWeb.hidden = NO;
}

-(void) webViewDidFinishLoad:(UIWebView*) webView
{
    [self.loadingWeb stopAnimating];
    self.loadingWeb.hidden = YES;
    [self addSubview:_web];
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    
    self.loadingWeb.frame = CGRectMake(CGRectGetWidth(self.bounds) - 30, CGRectGetHeight(self.bounds) - 150, 30, 30);//CGRectMake(CGRectGetWidth(self.bounds) - 30, CGRectGetHeight(self.bounds) - 60, 30, 30);
    //_backButton.frame = CGRectMake(5, 20, 30, 30);
    //_toFavoriteButton.frame = CGRectMake(CGRectGetWidth(self.bounds) - 40, 20, 30, 30);
    _web.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    //_topBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 30);
    //_titleOfNews.frame = CGRectMake(40, 10, CGRectGetWidth(self.bounds) - 80, 40);
    //_titleOfNews.font = [UIFont fontWithName:Nil size:15.0f];
}




@end
