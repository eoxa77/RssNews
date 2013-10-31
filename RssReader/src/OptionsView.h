//
//  OptionsView.h
//  1
//
//  Created by fgf_1 on 17.10.13.
//  Copyright (c) 2013 fgf_1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsCell.h"


@protocol OptionsViewDelegate <NSObject>

-(void) changeFont:(NSString*) nameOfFont;

@end

@interface OptionsView : UIView

@property (nonatomic, weak) id<OptionsViewDelegate> delegate;

-(void) reloadTableOfOptions;

@end


