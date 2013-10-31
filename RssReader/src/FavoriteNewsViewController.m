//
//  FavoriteNewsViewController.m
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "FavoriteNewsViewController.h"

@interface FavoriteNewsViewController ()<FavoriteNewsViewDelegate>

@property (strong)  FavoriteNewsView* favoriteNewsView;
@property (strong) OpenNewsViewController* openNewsViewController;

@end

@implementation FavoriteNewsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Favorite", @"Favorite");
        self.tabBarItem.image = [UIImage imageNamed:@"heart.png"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tabBarController setTitle:@"Favorite"];
    self.navigationController.navigationBarHidden=NO;
    
    NSString* titlesDocArray = [DOCUMENTS stringByAppendingPathComponent:@"arrayNews.plist"];
    
    NSMutableArray* array = [NSMutableArray arrayWithContentsOfFile:titlesDocArray];
    _favoriteNewsView.rssNews = [NSMutableArray arrayWithArray:array];
    [self.favoriteNewsView reloadTableOfNews];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.favoriteNewsView = [[FavoriteNewsView alloc] initWithFrame:self.view.bounds];
    self.favoriteNewsView.delegate = self;
    self.favoriteNewsView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_favoriteNewsView];

    
    
}

-(void) openNews:(NSInteger)number withFavoriteButton:(BOOL)willButton
{
    if (!self.openNewsViewController) {
        self.openNewsViewController = [OpenNewsViewController new];
    }
    
    _openNewsViewController.newsItem = [NSDictionary dictionaryWithDictionary:[self.favoriteNewsView.rssNews objectAtIndex:number]];
    _openNewsViewController.hideFavoriteButton = willButton;
    
    //self.navigationController.navigationBarHidden = YES;
    [self.navigationController pushViewController:_openNewsViewController animated:YES];
}

@end
