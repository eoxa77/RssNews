//
//  FavoriteNewsView.h
//  1
//
//  Created by fgf_1 on 17.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCell.h"

@protocol FavoriteNewsViewDelegate <NSObject>

-(void) openNews:(NSInteger)number withFavoriteButton:(BOOL)willButton;

@end

@interface FavoriteNewsView : UIView

@property (nonatomic, weak) id<FavoriteNewsViewDelegate> delegate;
@property (strong, nonatomic) NSMutableArray *rssNews;

-(void) reloadTableOfNews;

@end
