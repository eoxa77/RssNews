//
//  NewsCell.m
//  1
//
//  Created by fgf_1 on 19.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell()



@end

@implementation NewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleOfNews = [UILabel new];
        self.descriptionOfNews = [UITextView new];
        self.tagsOfNews = [UILabel new];
        
        [self.contentView addSubview:_titleOfNews];
        [self.contentView addSubview:_descriptionOfNews];
        [self.contentView addSubview:_tagsOfNews];
        
    }
    return self;
}

-(void) layoutSubviews
{
    [super layoutSubviews];
    
    _titleOfNews.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), 20);
    _descriptionOfNews.frame = CGRectMake(0, 22, CGRectGetWidth(self.bounds), 55);
    _tagsOfNews.frame = CGRectMake(0, 80, CGRectGetWidth(self.bounds), 30);
    
}


@end
