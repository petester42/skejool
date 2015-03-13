//
//  NavigationHeader.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@protocol BackDelegate <NSObject>
@required
-(void)goBack:(id)sender;
@end

@interface NavigationHeader : UIView /*<UIPopoverControllerDelegate>*/ {
    
    id <BackDelegate> backDelegate; 

    UILabel *title;
    UIPopoverController *popoverController;
}

@property (nonatomic, assign) id <BackDelegate> backDelegate; 
@property (nonatomic, retain) UILabel *title;
@property (nonatomic, retain) UIPopoverController *popoverController;

-(id)initWithFrame:(CGRect)frame withSettings:(BOOL)settings andBack:(BOOL)back;
-(void)showSettings:(id)sender;
-(void)back:(id)sender;
-(void)dismissPopover:(id)sender;
-(void)addObserver;
-(void)removeObserver;

@end
