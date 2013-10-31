//
//  MainWindowTabBar.m
//  1
//
//  Created by fgf_1 on 16.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "MainWindowTabBar.h"

@implementation MainWindowTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ViewWithNews* newsFromInternet = [ViewWithNews new];
        ViewWithFavoritesNews* newsFromData = [ViewWithFavoritesNews new];
        ViewWithOptions* fontOptions = [ViewWithOptions new];
        [self
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
