//
//  SettingsViewController.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.view.backgroundColor = DARK_GRAY;
    self.title = @"Information";
    
    UILabel *settings = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 240)];
    settings.backgroundColor = [UIColor clearColor];
    settings.textColor = LIGHT_GRAY;
    settings.textAlignment = UITextAlignmentCenter;
    settings.font = [UIFont fontWithName:FONT_NAME size:18];
    settings.lineBreakMode = UILineBreakModeWordWrap;
    settings.numberOfLines = 0;
    settings.text = [NSString stringWithFormat:@"%@ %@\nCreated by Skejool inc.\n\n%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"],[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"],MEMBERS];
    
    UIButton *logoutBTN = [[UIButton alloc] initWithFrame:CGRectMake(10, settings.frame.size.height + settings.frame.origin.y + 10, 300, 50)];
    [logoutBTN setTitle:@"LOGOUT" forState:UIControlStateNormal];
    [logoutBTN addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    [logoutBTN.titleLabel setFont:[UIFont fontWithName:BOLD_FONT_NAME size:25]];
    [logoutBTN setTitleColor:DARK_GRAY forState:UIControlStateNormal];
    [logoutBTN setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [logoutBTN setBackgroundImage:[Helper imageWithColor:LIGHT_GRAY] forState:UIControlStateNormal];
    [logoutBTN setBackgroundImage:[Helper imageWithColor:DARK_RED] forState:UIControlStateHighlighted];        
    
    CALayer *capa = logoutBTN.layer;
    CGRect bounds = capa.bounds;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                                   byRoundingCorners:UIRectCornerAllCorners
                                                         cornerRadii:CGSizeMake(10.0, 10.0)];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    
    capa.mask = maskLayer;

    [self.view addSubview:logoutBTN];
    [self.view addSubview:settings];
    
    [logoutBTN release];
    [settings release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

#pragma methods

-(void)logout:(id)sender{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Logout\nAre you sure?" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"Yes" otherButtonTitles:@"NO", nil];
    
    [sheet showInView:self.view];
    [sheet release];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"dismissPopover" object:nil];
        [Helper showLoginViewAnimated:YES];

    }
    
}

@end
