//
//  NewsFromInternetViewController.m
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "NewsFromInternetViewController.h"

@interface NewsFromInternetViewController ()<NewsFromInternetViewDelegate, NSURLConnectionDelegate>

@property (strong)  NewsFromInternetView* newsFromInternetView;
@property (strong) OpenNewsViewController* openNewsViewController;



@end




@implementation NewsFromInternetViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"News", @"News");
        self.tabBarItem.image = [UIImage imageNamed:@"news.png"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabBarController setTitle:@"News"];
    self.navigationController.navigationBarHidden=NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.newsFromInternetView = [[NewsFromInternetView alloc] initWithFrame:self.view.bounds];
    _newsFromInternetView.delegate = self;
    _newsFromInternetView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.newsFromInternetView];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.raywenderlich.com/feed"]];
    NSOperationQueue* queue = [NSOperationQueue new];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        if ([data length] > 0 && error == nil)
        {
            
            NSError* _error;
            TBXML * tbxml = [[TBXML alloc] initWithXMLData:data error:&_error];
            if (_error) {
                NSLog(@"Ошибка парсинга:%@", error.localizedDescription);
                return;
            }
            TBXMLElement *root = tbxml.rootXMLElement;
            if (!root) {
                NSLog(@"Ошибка чтения корня XML");
                return;
            }
            TBXMLElement *channel = [TBXML childElementNamed:@"channel" parentElement:root];
            if (channel)
            {                
                TBXMLElement *item = [TBXML childElementNamed:@"item" parentElement:channel];
                while (item) {
                    TBXMLElement *title = [TBXML childElementNamed:@"title" parentElement:item];
                    TBXMLElement *link = [TBXML childElementNamed:@"link" parentElement:item];
                    TBXMLElement *description = [TBXML childElementNamed:@"description" parentElement:item];
                    TBXMLElement *category = [TBXML childElementNamed:@"category" parentElement:item];
                    NSMutableString* allCategory = [NSMutableString string];
                    [allCategory appendString:@"TAGS:  "];
                    while (category) {
                        
                        [allCategory appendString:[TBXML textForElement:category]];
                        [allCategory appendString:@", "];
                        category = [TBXML nextSiblingNamed:@"category" searchFromElement:category];
                        
                    }
                    NSRange tmp = NSMakeRange(allCategory.length - 2, 2);
                    [allCategory deleteCharactersInRange:tmp];
                    
                    NSDictionary *newsItem = [NSDictionary dictionaryWithObjectsAndKeys:
                                              [TBXML textForElement:title], @"title",
                                              [TBXML textForElement:description], @"desc",
                                              [TBXML textForElement:link],@"link",
                                              allCategory,@"tags",
                                              nil];
                    [self.newsFromInternetView.rssNews addObject:newsItem];
                    
                    item = [TBXML nextSiblingNamed:@"item" searchFromElement:item];
                }
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.newsFromInternetView reloadTableOfNews];
            });
            
            
        }
        else if ([data length] == 0 && error == nil)
            NSLog(@"Nothing was download");
        else if (error != nil && error.code == NSURLErrorTimedOut)
            NSLog(@"Time out");
        else if (error != nil)
            NSLog(@"download error");
    }];
    

}


-(void) openNews:(NSInteger)number withFavoriteButton:(BOOL)willButton
{
    if (!self.openNewsViewController) {
        self.openNewsViewController = [OpenNewsViewController new];
    }
    
    _openNewsViewController.newsItem = [NSDictionary dictionaryWithDictionary:[self.newsFromInternetView.rssNews objectAtIndex:number]];
    _openNewsViewController.hideFavoriteButton = willButton;
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController pushViewController:_openNewsViewController animated:YES];
     
}

@end
