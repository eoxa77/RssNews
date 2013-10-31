//
//  FavoriteNewsView.m
//  1
//
//  Created by fgf_1 on 17.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "FavoriteNewsView.h"

@interface FavoriteNewsView()<UITableViewDataSource,UITableViewDelegate>

@property (strong)  UITextView* nameOfPage;
@property (strong)  UIView* line;
@property (strong)  UITableView* tableOfNews;

@end

@implementation FavoriteNewsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.nameOfPage = [UITextView new];
        _nameOfPage.text = @"Favorite";
        _nameOfPage.font = [UIFont systemFontOfSize:20.0f];
        [_nameOfPage setUserInteractionEnabled:NO];
        _nameOfPage.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameOfPage];
        
        self.line = [UIView new];
        _line.backgroundColor = [UIColor whiteColor];
        [self addSubview:_line];
        
        self.tableOfNews = [UITableView new];
        self.tableOfNews.delegate = self;
        self.tableOfNews.dataSource = self;
        [self addSubview:_tableOfNews];
    }
    return self;
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    self.nameOfPage.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 50);
    self.line.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 20);
    self.tableOfNews.frame = CGRectMake(0, 60, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - 110);
}

-(void) reloadTableOfNews
{
    [self.tableOfNews reloadData];
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(openNews:withFavoriteButton:)]) {
        [self.delegate openNews:indexPath.row withFavoriteButton:YES];
    }
}



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger countOfRow = self.rssNews.count;
    return countOfRow;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* cellID = @"cellFavoriteID";
    [tableView registerClass:[NewsCell class] forCellReuseIdentifier:cellID];
    NewsCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell==nil) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    UIFontDescriptor* fontOfText = [UIFontDescriptor fontDescriptorWithName:[[NSUserDefaults standardUserDefaults]objectForKey:@"font"] size:1.0f];
    
    NSDictionary *newsItem = [_rssNews objectAtIndex:indexPath.row];
    cell.titleOfNews.text = [newsItem objectForKey:@"title"];
    cell.titleOfNews.font = [UIFont fontWithDescriptor:fontOfText size:15.0f];
    cell.titleOfNews.textAlignment = 1;
    
    NSString* badText = [newsItem objectForKey:@"desc"];
    NSRange range = [badText rangeOfString:@"<p><" ];
    NSRange goodRange = NSMakeRange(3, range.location-3);
    NSString* goodText = [badText substringWithRange:goodRange];
    
    cell.descriptionOfNews.text = goodText;
    cell.descriptionOfNews.font = [UIFont fontWithDescriptor:fontOfText size:13.0f];
    [cell.descriptionOfNews setUserInteractionEnabled:NO];
    
    cell.tagsOfNews.text = [newsItem objectForKey:@"tags"];
    cell.tagsOfNews.font = [UIFont fontWithDescriptor:fontOfText size:10.0f];
    
    return cell;
}



@end
