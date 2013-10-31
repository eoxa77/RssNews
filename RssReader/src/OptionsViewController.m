//
//  OptionsViewController.m
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()<OptionsViewDelegate>

@property (strong)  OptionsView* optionsView;
@property (strong)  UITextView* nameOfPage;

@end

@implementation OptionsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Options", @"Options");
        self.tabBarItem.image = [UIImage imageNamed:@"settings.png"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tabBarController setTitle:@"Options"];
    self.navigationController.navigationBarHidden=NO;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.optionsView = [[OptionsView alloc] initWithFrame:self.view.bounds];
    self.optionsView.delegate = self;
    self.optionsView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.optionsView.frame = self.view.bounds;
	self.optionsView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_optionsView];
}

- (void) changeFont:(NSString *)nameOfFont
{
    [[NSUserDefaults standardUserDefaults] setObject:nameOfFont forKey:@"newFont"];
    [self.optionsView reloadTableOfOptions];
}

@end
