//
//  OpenNewsViewController.m
//  1
//
//  Created by fgf_1 on 23.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "OpenNewsViewController.h"

@interface OpenNewsViewController ()

@property (strong) UIButton* toFavoriteButton;
//@property (strong) OpenNewsTitleView* openNewsTitleView;

@end

@implementation OpenNewsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //[self.navigationController.navigationBar setHidden:YES];
    
    
    
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                    initWithImage:[UIImage imageNamed:@"back-icon.png"]
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(returnMainWindow)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *favoriteButton = [[UIBarButtonItem alloc]
                                   initWithImage:[UIImage imageNamed:@"favorite.png"]
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(addFavorite)];
    self.navigationItem.rightBarButtonItem = favoriteButton;
    
    
    
    //
    //self.openNewsTitleView = [[OpenNewsTitleView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 55)];
    //self.navigationController.navigationItem.titleView = _openNewsTitleView;
    
    //self.navigationController.navigationItem set
    //self.navigationItem.titleView = _openNewsTitleView;
    //_openNewsTitleView.delegate = self;
    
    //UIBarButtonItem* backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-icon.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(returnMainWindow)];
    
    //[self.navigationController.navigationItem setLeftBarButtonItem:backButton];
    
}

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.navigationItem.title = [self.newsItem objectForKey:@"title"];
    
    self.openNewsView = [[OpenNewsView alloc] initWithFrame:CGRectMake(0, 60, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    [self.view addSubview:_openNewsView];
    _openNewsView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //self.navigationController.navigationBar.translucent = NO;
    //[self.navigationController.navigationBar setHidden:YES];// setTitle:[self.newsItem objectForKey:@"title"]];
    //[self.tabBarController setTitle:[self.newsItem objectForKey:@"title"]];
    
    /*NSString* badText = [self.newsItem objectForKey:@"desc"];
    NSRange startRange = [badText rangeOfString:@"href=\"" ];
    NSRange endRange = [badText rangeOfString:@"\">"];
    NSRange goodRange = NSMakeRange(startRange.location+startRange.length, endRange.location);
    badText = [badText substringWithRange:goodRange];
    endRange = [badText rangeOfString:@"\">"];
    
    _openNewsView.link = [badText substringWithRange:NSMakeRange(0, endRange.location)];*/
    
    _openNewsView.link = [self.newsItem objectForKey:@"link"];
    
    NSURL* url = [NSURL URLWithString:_openNewsView.link];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];

    [self.openNewsView.web loadRequest:request];

    //_openNewsView.titleOfNews.text = [self.newsItem objectForKey:@"title"];
    
   
}

-(void) returnMainWindow
{
   
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) addFavorite
{
    NSString *titlesDocDictionary = [DOCUMENTS stringByAppendingPathComponent:@"titlesOfNews.plist"];
    NSString *titlesPathDictionary = [[NSBundle mainBundle] pathForResource:@"titlesOfNews" ofType:@"plist"];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:titlesDocDictionary]) {
        [[NSFileManager defaultManager] copyItemAtPath:titlesPathDictionary toPath:titlesDocDictionary error:nil];
        //NSLog(@"File saved");
    } else {
        //NSLog(@"File already exists");
    }
   
    
    NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithContentsOfFile:titlesDocDictionary];
    
    if ([[dic objectForKey:[self.newsItem objectForKey:@"title"]]isEqualToString:@"YES"]) {
        
        //NSLog(@"not add");
        UIAlertView* notAdd = [[UIAlertView alloc] initWithTitle:@"Already favorite" message:@"This article is already a favorite" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [notAdd show];
        return;
        
    }
    else {
        
        NSLog(@"add");
        NSString* tmp = [NSString stringWithString:[self.newsItem objectForKey:@"title"]];

        [dic setObject:@"YES" forKey:tmp];
        [dic writeToFile:titlesDocDictionary atomically:YES];
        
        NSString* titlesDocArray = [DOCUMENTS stringByAppendingPathComponent:@"arrayNews.plist"];
        NSString* titlesPathArray = [[NSBundle mainBundle] pathForResource:@"arrayNews" ofType:@"plist"];
        
        if (![[NSFileManager defaultManager] fileExistsAtPath:titlesDocArray]) {
             [[NSFileManager defaultManager] copyItemAtPath:titlesPathArray toPath:titlesDocArray error:nil];
        NSLog(@"File saved");
         }
        NSMutableArray* array = [NSMutableArray arrayWithContentsOfFile:titlesDocArray];
        
        [array addObject:self.newsItem];
        [array writeToFile:titlesDocArray atomically:YES];
        
        UIAlertView* nowAdd = [[UIAlertView alloc] initWithTitle:@"New favorite" message:@"This article is now favorite" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [nowAdd show];
                
    }
    
    
    
}

-(BOOL) hideFavoriteButton
{
    return _hideFavoriteButton;
}

@end
