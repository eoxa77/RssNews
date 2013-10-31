//
//  NewsCell.h
//  1
//
//  Created by fgf_1 on 19.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell

@property (nonatomic, strong) UILabel* titleOfNews;
@property (nonatomic, strong) UITextView* descriptionOfNews;
@property (nonatomic, strong) UILabel* tagsOfNews;

@end
