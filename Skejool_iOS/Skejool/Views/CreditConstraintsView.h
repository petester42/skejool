//
//  CreditConstraintsView.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "TableHeaderView.h"

@interface CreditConstraintsView : UIView <UIPickerViewDelegate, UIPickerViewDataSource> {
    
    UIPickerView *minCredits;
    UIPickerView *maxCredits;
}

@property (nonatomic, retain) UIPickerView *minCredits;
@property (nonatomic, retain) UIPickerView *maxCredits;

-(void)clearConstraints:(id)sender;

@end
