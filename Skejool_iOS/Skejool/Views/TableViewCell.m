//
//  TableViewCell.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize textLabel, background, activityIndicator, isRequest;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
    }
    
    return self;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withType:(int)type{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 50)];
        view.backgroundColor = [UIColor clearColor];
        
        background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];        
        background.backgroundColor = LIGHT_GRAY;
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, view.frame.size.width-20, view.frame.size.height)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = [UIFont fontWithName:BOLD_FONT_NAME size:25];
        
        activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        activityIndicator.center = CGPointMake(0.5, 1.0);
        activityIndicator.frame = CGRectMake(view.frame.size.width-activityIndicator.frame.size.width-10, view.frame.size.height/2 -10, activityIndicator.frame.size.width, activityIndicator.frame.size.height);
        activityIndicator.hidesWhenStopped = YES;
        
        [view addSubview:background];
        [view addSubview:textLabel];
        [view addSubview:activityIndicator];
        
        [background release];
        [textLabel release];
        [activityIndicator release];
        
        CALayer *capa = view.layer;
        CGRect bounds = capa.bounds;
        
        UIBezierPath *maskPath;
        
        if (type == 1) {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                             byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                   cornerRadii:CGSizeMake(10.0, 10.0)];
            
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height-1, 300, 1)];
            line.backgroundColor = MEDIUM_GRAY;
            [view addSubview:line];
            [line release];
        }
        
        else if (type == 2){
            maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                             byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                   cornerRadii:CGSizeMake(10.0, 10.0)];
            
        }
        
        else if (type == 3){
            maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                             byRoundingCorners:UIRectCornerAllCorners
                                                   cornerRadii:CGSizeMake(10.0, 10.0)];
        }
        
        else {
            maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                             byRoundingCorners:UIRectCornerAllCorners
                                                   cornerRadii:CGSizeMake(0.0, 0.0)];
            UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height-1, 300, 1)];
            line.backgroundColor = MEDIUM_GRAY;
            [view addSubview:line];
            [line release];
        }
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = bounds;
        maskLayer.path = maskPath.CGPath;
        
        //      [capa addSublayer:maskLayer];
        capa.mask = maskLayer;
        
        [self.contentView addSubview:view];
        
        [view release];
        
#warning change this maybe to using mbprogresshud instead
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(stopActivity) 
                                                     name:@"getSequenceRequestDone" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(stopActivity) 
                                                     name:@"getCoursesRequestDone" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(stopActivity) 
                                                     name:@"getSchedulesRequestDone" object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(stopActivityAndDeselect) 
                                                     name:@"getGenerateSchedulesRequestDone" object:nil];
        
    }
    
    return self;
}

-(void)dealloc{
    [super dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getSequenceRequestDone" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getCoursesRequestDone" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getSchedulesRequestDone" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getGenerateSchedulesRequestDone" object:nil];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
    
    if (selected == 1) {
        background.backgroundColor = DARK_RED;
        textLabel.textColor = [UIColor whiteColor];
        
        if (isRequest == YES) {
            
            [activityIndicator startAnimating];
            
        }
        
        else {
            [activityIndicator stopAnimating];
        }
    }
    else {
        background.backgroundColor = LIGHT_GRAY;
        textLabel.textColor = DARK_GRAY;
        
        if (isRequest == YES) {
            
            [activityIndicator stopAnimating];
        }
        
        else {
            [activityIndicator stopAnimating];
        }
    }
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:YES];
    // Configure the view for the selected state
    
    if (highlighted == 1) {
        background.backgroundColor = DARK_RED;
        textLabel.textColor = [UIColor whiteColor];
    }
    
    else {
        background.backgroundColor = LIGHT_GRAY;
        textLabel.textColor = DARK_GRAY;
    }
}

-(void)startActivity{
    [activityIndicator startAnimating];
}

-(void)stopActivity{
    [activityIndicator stopAnimating];
}

-(void)stopActivityAndDeselect{
    [activityIndicator stopAnimating];
    [self setSelected:NO];
}

@end
