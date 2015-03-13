//
//  CreditConstraintsView.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-30.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CreditConstraintsView.h"

@implementation CreditConstraintsView

@synthesize minCredits, maxCredits;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(clearConstraints:) 
                                                     name:@"clearConstraints" object:nil];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2, 120, frame.size.width, 40)];
        title.backgroundColor = [UIColor clearColor];
        title.textAlignment = UITextAlignmentCenter;
        title.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
        title.adjustsFontSizeToFitWidth = YES;
        title.textColor = TEXT_COLOR;
        title.text = CREDIT_CONSTRAINTS_TITLE;
        title.layer.anchorPoint = CGPointMake(1.0,0.5);
        
        int x = 0;
        int y = section_height;
        
        minCredits = [[UIPickerView alloc] initWithFrame:CGRectZero];
        minCredits.frame = CGRectMake(x, y, minCredits.frame.size.width, minCredits.frame.size.height);
        minCredits.delegate = self;
        minCredits.dataSource = self;
        minCredits.tag = 1;
        minCredits.showsSelectionIndicator = YES;
        [minCredits selectRow:[[[[Data sharedInstance] CreditConstraints] objectForKey:@"min"] intValue] inComponent:0 animated:NO];
        
        maxCredits = [[UIPickerView alloc] initWithFrame:CGRectZero];
        maxCredits.frame = CGRectMake(x + minCredits.frame.size.width, y, maxCredits.frame.size.width, maxCredits.frame.size.height);
        maxCredits.delegate = self;
        maxCredits.dataSource = self;
        maxCredits.tag = 2;
        maxCredits.showsSelectionIndicator = YES;
        [maxCredits selectRow:[[[[Data sharedInstance] CreditConstraints] objectForKey:@"max"] intValue] inComponent:0 animated:NO];
        
        int width = 320*2;
        
        TableHeaderView *header = [[[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, width, section_height)] autorelease];
        [header addCreditLabelsWithWidth:header.frame.size.width andHeight:section_height];
        
        UIView *pickerView = [[UIView alloc] initWithFrame:CGRectMake((frame.size.width-width)/2,title.frame.origin.y + title.frame.size.height, width, minCredits.frame.size.height+header.frame.size.height)];
        
        [pickerView addSubview:minCredits];
        [pickerView addSubview:maxCredits];
        [pickerView addSubview:header];
        
        [maxCredits release];
        [minCredits release];
        
        UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2, pickerView.frame.origin.y + pickerView.frame.size.height, width, 200)];
        info.backgroundColor = [UIColor clearColor];
        info.textAlignment = UITextAlignmentCenter;
        info.font = [UIFont fontWithName:BOLD_FONT_NAME size:18];
        info.adjustsFontSizeToFitWidth = YES;
        info.numberOfLines = 0;
        info.textColor = MEDIUM_GRAY;
        info.text = CREDIT_CONSTRAINTS_INFO;
        info.layer.anchorPoint = CGPointMake(1.0,0.5);
        
        [self addSubview:title];
        [self addSubview:pickerView];
        [self addSubview:info];
        
        [pickerView release];
        [title release];
        [info release];
        
        CALayer *capa = pickerView.layer;
        CGRect bounds = capa.bounds;
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                                       byRoundingCorners:UIRectCornerAllCorners
                                                             cornerRadii:CGSizeMake(10.0, 10.0)];
        
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = bounds;
        maskLayer.path = maskPath.CGPath;
        
        capa.mask = maskLayer;
        
    }
    
    return self;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return 25;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (row == 0 && pickerView.tag == 1){
        return @"No Minimum";
    }
    
    if (row == 0 && pickerView.tag == 2){
        return @"No Maximum";
    }
    
    return [NSString stringWithFormat:@"%i",row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (pickerView.tag == 1) {
        [[[Data sharedInstance] CreditConstraints] setValue:[NSNumber numberWithInt:row] forKey:@"min"];
        return;
    }
    
    if (pickerView.tag == 2) {
        
        [[[Data sharedInstance] CreditConstraints] setValue:[NSNumber numberWithInt:row] forKey:@"max"];
    }
    
}

-(void)clearConstraints:(id)sender{
    [minCredits selectRow:[[[[Data sharedInstance] CreditConstraints] objectForKey:@"min"] intValue] inComponent:0 animated:NO];
    [maxCredits selectRow:[[[[Data sharedInstance] CreditConstraints] objectForKey:@"max"] intValue] inComponent:0 animated:NO];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"clearConstraints" object:nil];
    [super dealloc];
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
