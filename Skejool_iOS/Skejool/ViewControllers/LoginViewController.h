//
//  LoginViewController.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "LightGrayView.h"
#import "ZBarSDK.h"

@interface LoginViewController : UIViewController <ZBarReaderDelegate, UITextFieldDelegate> {
    
    UITextField *userName;
    UITextField *password;
}

@property (nonatomic,retain) UITextField *userName;
@property (nonatomic,retain) UITextField *password;

-(void)showBarcodeScanner:(id)sender;
-(void)dismissModalController:(id)seder;
-(void)keyboardDidAppear:(id)sender;
-(void)keyboardDidDisappear:(id)sender;
-(void)login:(id)sender;
-(void)loginRequestDone:(id)sender;

@end
