//
//  OptionsCell.m
//  1
//
//  Created by fgf_1 on 24.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import "OptionsCell.h"

@interface OptionsCell()

@property (strong)  UITextView* fontOfApplication;
@property (strong)  UIImageView* selectFont;

@end

@implementation OptionsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.fontOfApplication = [UITextView new];
        [self.fontOfApplication setUserInteractionEnabled:NO];
        self.selectFont = [UIImageView new];
        [self addSubview:_fontOfApplication];
        [self addSubview:_selectFont];
    }
    return self;
}

-(void) layoutSubviews
{
    _fontOfApplication.frame = CGRectMake(5, 0, CGRectGetWidth(self.bounds) - 40, 20);
    _selectFont.frame = CGRectMake(CGRectGetWidth(self.bounds) - 20, 0, 20, 20);
}

-(void) setSelectedFont:(UIImage *)selectedFont
{
    _selectFont.image = selectedFont;
}

-(void) setFontOfDescribe:(NSString *)fontOfDescribe
{
    _fontOfApplication.text = fontOfDescribe;
    _fontOfDescribe = fontOfDescribe;
    _fontOfApplication.font = [UIFont fontWithName:fontOfDescribe size:10.0f];
}



@end
