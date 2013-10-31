//
//  OptionsView.m
//  1
//
//  Created by fgf_1 on 17.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "OptionsView.h"

@interface OptionsView()<UITableViewDataSource,UITableViewDelegate>

@property (strong)  UITextView* nameOfPage;
@property (strong)  UIView* line;
@property (strong)  UITableView* tableOfOptions;

@end

@implementation OptionsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _nameOfPage = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), 50)];
        _nameOfPage.text = @"Options";
        _nameOfPage.font = [UIFont systemFontOfSize:20.0f];
        [_nameOfPage setUserInteractionEnabled:NO];
        _nameOfPage.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameOfPage];
        
        self.line = [UIView new];
        _line.backgroundColor = [UIColor whiteColor];
        [self addSubview:_line];
    
        self.tableOfOptions = [UITableView new];
        self.tableOfOptions.delegate = self;
        self.tableOfOptions.dataSource = self;
        [self addSubview:_tableOfOptions];
    }
    return self;
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    self.tableOfOptions.frame = CGRectMake(0, 50, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - 100);
    self.nameOfPage.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 50);
    self.line.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 20);
}

-(void) reloadTableOfNews
{
    [self.tableOfOptions reloadData];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.delegate && ([self.delegate respondsToSelector:@selector(changeFont:)])) {
        [self.delegate changeFont:[self getNameOfFontWithIndexPath:indexPath]];
    }
    
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily;
    NSInteger count = 0;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        count += [fontNames count];
    }

    return count;
}

-(NSString*) foundFontWithNumber:(NSInteger) number
{
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    NSInteger count = 0;
    for (indFamily=0; indFamily<[familyNames count]; ++indFamily)
    {
        fontNames = [[NSArray alloc] initWithArray:
                     [UIFont fontNamesForFamilyName:
                      [familyNames objectAtIndex:indFamily]]];
        for (indFont=0; indFont<[fontNames count]; ++indFont)
        {
            if (count == number) {
                return [fontNames objectAtIndex:indFont];
            }
            count++;
        }
    }

    
    return nil;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString* cellID = @"cellID";
    [tableView registerClass:[OptionsCell class] forCellReuseIdentifier:cellID];
    OptionsCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell==nil) {
        cell = [[OptionsCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.fontOfDescribe = [self foundFontWithNumber:indexPath.row];
    NSString* fontOfApplication =[[NSUserDefaults standardUserDefaults] objectForKey:@"font"];
    
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"font"] isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"newFont"]]) {
        if ([cell.fontOfDescribe isEqualToString: fontOfApplication]) {
            cell.selectedFont = [UIImage imageNamed:@"tick.png"];
        }
        else {
            cell.selectedFont = [UIImage imageNamed:@"bullet_black.png"];
        }
    }
    else {
        if ([cell.fontOfDescribe isEqualToString: [[NSUserDefaults standardUserDefaults] objectForKey:@"newFont"]]) {
            cell.selectedFont = [UIImage imageNamed:@"tick.png"];
        }
        else {
            cell.selectedFont = [UIImage imageNamed:@"bullet_black.png"];
        }
    }
    return cell;
}

-(NSString*) getNameOfFontWithIndexPath: (NSIndexPath*) indexPath
{
    OptionsCell* cell = (OptionsCell*)[_tableOfOptions cellForRowAtIndexPath:indexPath];
    return cell.fontOfDescribe;
}

-(void) reloadTableOfOptions
{
    [self.tableOfOptions reloadData];
    
}


@end
