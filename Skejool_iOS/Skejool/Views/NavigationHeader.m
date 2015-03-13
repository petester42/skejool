//
//  NavigationHeader.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NavigationHeader.h"
#import "AppDelegate.h"

@implementation NavigationHeader

@synthesize title, backDelegate, popoverController;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame withSettings:(BOOL)settings andBack:(BOOL)back{
    self = [super initWithFrame:frame];
   
    if (self) {
    
        // Initialization code
        UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        backgroundImage.image = [UIImage imageNamed:@"Background-Left.png"];
        
        [self addSubview:backgroundImage];
        
        [backgroundImage release];
        
        [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [self.layer setShadowOffset:CGSizeMake(0, 0)];
        [self.layer setShadowOpacity:0.75];
        [self.layer setShadowRadius:10.0f];
        self.layer.masksToBounds = NO;
         
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(15, 0, frame.size.width-2*15, frame.size.height)];
        self.layer.shadowPath = path.CGPath;
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(60, 12, 200, 30)];
        title.backgroundColor = [UIColor clearColor];
        title.textAlignment = UITextAlignmentCenter;
        title.font = [UIFont fontWithName:BOLD_FONT_NAME size:30];
        title.adjustsFontSizeToFitWidth = YES;
        title.textColor = TEXT_COLOR;
        [title.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [title.layer setShadowOffset:CGSizeMake(0, 1)];
        [title.layer setShadowOpacity:0.75];
        [title.layer setShadowRadius:5.0f];
        title.layer.masksToBounds = NO;
        
        if (settings == YES) {
            UIButton *settingButton = [[UIButton alloc] initWithFrame:CGRectMake(320 - 11 - 5 - 27, 11, 27, 27)];
            [settingButton setImage:[Helper getGearImage] forState:UIControlStateNormal];
            [settingButton addTarget:self action:@selector(showSettings:) forControlEvents:UIControlEventTouchUpInside];
            settingButton.showsTouchWhenHighlighted = YES;
    
            [settingButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [settingButton.layer setShadowOffset:CGSizeMake(0, 1)];
            [settingButton.layer setShadowOpacity:0.75];
            [settingButton.layer setShadowRadius:5.0f];
            settingButton.layer.masksToBounds = NO;
            
            [self addSubview:settingButton];
            [settingButton release];
        }
        
        else {
            
        }
        
        if (back == YES) {
            UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(11+5, 13, 28, 24)];
            [backButton setImage:[Helper getBackImage] forState:UIControlStateNormal];
            [backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
            backButton.showsTouchWhenHighlighted = YES;
            
            [backButton.layer setShadowColor:[[UIColor blackColor] CGColor]];
            [backButton.layer setShadowOffset:CGSizeMake(0, 1)];
            [backButton.layer setShadowOpacity:0.75];
            [backButton.layer setShadowRadius:5.0f];
            backButton.layer.masksToBounds = NO;

            
            [self addSubview:backButton];
            [backButton release];
        }
        
        else {
            
        }
        
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(10, frame.size.height-1, 300, 1)];
        line.backgroundColor = MEDIUM_GRAY;
            
        [self addSubview:title];
        [self addSubview:line];
        
        [line release];
        [title release];
        
        
     
    }
    
    return self;
}

-(void)addObserver{
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(dismissPopover:) 
                                                 name:@"dismissPopover" object:nil];

}

-(void)removeObserver{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"dismissPopover" object:nil];    
}

-(void)dealloc:(id)sender{
    [super dealloc];
    
    [self removeObserver];
}

-(void)showSettings:(id)sender{
  
    SettingsViewController *contentViewController = [[SettingsViewController alloc] init];
    
    popoverController = [[UIPopoverController alloc] initWithContentViewController:contentViewController];
    popoverController.popoverContentSize = CGSizeMake(320, 325);
    
    [contentViewController release];
    
    [popoverController presentPopoverFromRect:[sender frame] inView:self permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

-(void)back:(id)sender{
   
    if([self.backDelegate respondsToSelector:@selector(goBack:)])
    {        
        [self.backDelegate goBack:self];
    }
    
}

-(void)dismissPopover:(id)sender{
    [popoverController dismissPopoverAnimated:YES];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"dismissPopover" object:nil];    
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
