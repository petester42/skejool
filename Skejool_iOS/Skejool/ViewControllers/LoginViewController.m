//
//  LoginViewController.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-10.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize userName, password;

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
      
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(loginRequestDone:) 
                                                 name:@"loginRequestDone" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidAppear:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidDisappear:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 748)];
    backgroundImage.image = [UIImage imageNamed:@"Background-Login.png"];
    
    [self.view addSubview:backgroundImage];
    
    [backgroundImage release];
    
    UIView *containerView = [[UIView alloc] initWithFrame:self.view.frame];
    containerView.tag = 1;
    
    UIImageView *appName = [[UIImageView alloc] initWithFrame:CGRectMake((1024-450)/2, 160, 436, 105)];
    appName.image = [Helper getLogoImage];
    
    LightGrayView *detailsView = [[LightGrayView alloc] initWithFrame:CGRectMake((1024-420)/2, appName.frame.size.height+appName.frame.origin.y+20, 420, 127)];   
    
    UIView *grayline = [[UIView alloc] initWithFrame:CGRectMake(0, detailsView.frame.size.height/2, detailsView.frame.size.width, 1)];
    grayline.backgroundColor = MEDIUM_GRAY;
    
    userName = [[UITextField alloc] initWithFrame:CGRectMake(20, 0, detailsView.frame.size.width-40, 63)];
    userName.placeholder = @"ID NUMBER";
    userName.userInteractionEnabled = YES;
    userName.clearButtonMode = UITextFieldViewModeWhileEditing;
    userName.autocorrectionType = UITextAutocorrectionTypeNo;
    userName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //    userName.keyboardType = UIKeyboardTypeNumberPad;
    userName.returnKeyType = UIReturnKeyNext;
    userName.delegate = self;
    userName.text = @"";
    
    password = [[UITextField alloc] initWithFrame:CGRectMake(userName.frame.origin.x, userName.frame.size.height + 1, userName.frame.size.width, userName.frame.size.height)];
    password.placeholder = @"PASSWORD";
    password.userInteractionEnabled = YES;
    password.clearButtonMode = UITextFieldViewModeWhileEditing;
    password.autocorrectionType = UITextAutocorrectionTypeNo;
    password.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    password.returnKeyType = UIReturnKeyDone;
    password.secureTextEntry = YES;
    password.delegate = self;
    password.text = @"";
    
    [detailsView addSubview:grayline];
    [detailsView addSubview:userName];
    [detailsView addSubview:password];
    
    [grayline release];
    [userName release];
    [password release];
    
    [containerView addSubview:detailsView];
    [containerView addSubview:appName];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){	
        
        UIButton *loginBTN = [[UIButton alloc] initWithFrame:CGRectMake(detailsView.frame.origin.x, detailsView.frame.size.height+detailsView.frame.origin.y+20, 420, 60)];
        [loginBTN setTitle:@"LOGIN" forState:UIControlStateNormal];
        [loginBTN addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
     /*   [loginBTN.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [loginBTN.layer setShadowOffset:CGSizeMake(0, 0)];
        [loginBTN.layer setShadowOpacity:0.75];
        [loginBTN.layer setShadowRadius:10.0f];*/
        [loginBTN.titleLabel setFont:[UIFont fontWithName:BOLD_FONT_NAME size:25]];
        [loginBTN setTitleColor:DARK_GRAY forState:UIControlStateNormal];
        [loginBTN setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

        [loginBTN setBackgroundImage:[Helper imageWithColor:LIGHT_GRAY] forState:UIControlStateNormal];
        [loginBTN setBackgroundImage:[Helper imageWithColor:DARK_RED] forState:UIControlStateHighlighted];        
              
        CALayer *capa = loginBTN.layer;
        CGRect bounds = capa.bounds;
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                                       byRoundingCorners:UIRectCornerAllCorners
                                                             cornerRadii:CGSizeMake(10.0, 10.0)];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = bounds;
        maskLayer.path = maskPath.CGPath;
        
        capa.mask = maskLayer;
        
        [containerView addSubview:loginBTN];
        [loginBTN release];
        
    }
    
    else {
        UIButton *loginBTN = [[UIButton alloc] initWithFrame:CGRectMake(detailsView.frame.origin.x, detailsView.frame.size.height+detailsView.frame.origin.y+20, 305, 60)];
        [loginBTN setTitle:@"LOGIN" forState:UIControlStateNormal];
        [loginBTN addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
        /*[loginBTN.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [loginBTN.layer setShadowOffset:CGSizeMake(0, 0)];
        [loginBTN.layer setShadowOpacity:0.75];
        [loginBTN.layer setShadowRadius:10.0f];*/
        [loginBTN.titleLabel setFont:[UIFont fontWithName:BOLD_FONT_NAME size:25]];
        [loginBTN setTitleColor:DARK_GRAY forState:UIControlStateNormal];
        [loginBTN setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        [loginBTN setBackgroundImage:[Helper imageWithColor:LIGHT_GRAY] forState:UIControlStateNormal];
        [loginBTN setBackgroundImage:[Helper imageWithColor:DARK_RED] forState:UIControlStateHighlighted];        
        
        CALayer *capa = loginBTN.layer;
        CGRect bounds = capa.bounds;
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                                       byRoundingCorners:UIRectCornerAllCorners
                                                             cornerRadii:CGSizeMake(10.0, 10.0)];
        
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = bounds;
        maskLayer.path = maskPath.CGPath;
        
        capa.mask = maskLayer;

        
        [containerView addSubview:loginBTN];
        [loginBTN release];
        
        UIButton *barcodeBTN = [[UIButton alloc] initWithFrame:CGRectMake(loginBTN.frame.origin.x + loginBTN.frame.size.width + 15, detailsView.frame.size.height+detailsView.frame.origin.y+20, 100, 60)];
        
        [barcodeBTN addTarget:self action:@selector(showBarcodeScanner:) forControlEvents:UIControlEventTouchUpInside];
        /*[barcodeBTN.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [barcodeBTN.layer setShadowOffset:CGSizeMake(0, 0)];
        [barcodeBTN.layer setShadowOpacity:0.75];
        [barcodeBTN.layer setShadowRadius:10.0f];*/
        [barcodeBTN setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        
        [barcodeBTN setBackgroundImage:[Helper imageWithColor:LIGHT_GRAY] forState:UIControlStateNormal];
        [barcodeBTN setBackgroundImage:[Helper imageWithColor:DARK_RED] forState:UIControlStateHighlighted];        
        
        CALayer *capa2 = barcodeBTN.layer;
        CGRect bounds2 = capa2.bounds;
        
        UIBezierPath *maskPath2 = [UIBezierPath bezierPathWithRoundedRect:bounds2 
                                                       byRoundingCorners:UIRectCornerAllCorners
                                                             cornerRadii:CGSizeMake(10.0, 10.0)];
        
        CAShapeLayer *maskLayer2 = [CAShapeLayer layer];
        maskLayer2.frame = bounds2;
        maskLayer2.path = maskPath2.CGPath;
        
        capa2.mask = maskLayer2;

        barcodeBTN.showsTouchWhenHighlighted = YES;
        
        UIImageView *barcodeImage = [[UIImageView alloc] initWithImage:[Helper getBarcodeImage]];
        barcodeImage.frame = CGRectMake(16,8,barcodeImage.frame.size.width,barcodeImage.frame.size.height);
        
        [barcodeBTN addSubview:barcodeImage];
        [barcodeImage release];
        
        [containerView addSubview:barcodeBTN];
        [barcodeBTN release];
        
    }
    
    [detailsView release];
    [appName release];
    
    [self.view addSubview:containerView];
    [containerView release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"loginRequestDone" object:nil];

    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return [Helper getInterfaceOrientation:interfaceOrientation];
}

#pragma mark - Controller Functions

-(void)login:(id)sender{
    
    if ([userName.text isEqualToString:@""] || [password.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" message:LOGIN_ERROR delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alert show];
        [alert release];
    }
    
    else{
        [Proxy loginWithUsername:userName.text andPassword:password.text];
    }
}
-(void)dismissModalController:(id)seder{
    
    [self dismissModalViewControllerAnimated:YES];
}

-(void)showBarcodeScanner:(id)sender{
    // ADD: present a barcode reader that scans from the camera feed
    
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_CODE128
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentModalViewController: reader
                            animated: YES];
    [reader release];
}

- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
    //    resultText.text = symbol.data;
    NSLog(@"%@",symbol.data);
    
    if ([symbol.data isEqualToString:@"21212960164313"]) {
        [self performSelector:@selector(login:)];
    }
    // EXAMPLE: do something useful with the barcode image
    //    resultImage.image =
    //    [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
}

#pragma mark - UITextFeild Delegate Methods

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == userName) {
        [password becomeFirstResponder];
    }
    
    else {
        [password resignFirstResponder];
    }
    
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    return YES;
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}

-(void)keyboardDidAppear:(id)sender{
    
    UIView *containerView = (UIView *)[self.view viewWithTag:1];
    
    [UIView beginAnimations:nil context:NULL];
    containerView.frame = CGRectMake(containerView.frame.origin.x, -120 , containerView.frame.size.width, containerView.frame.size.height);
    [UIView commitAnimations];
}

-(void)keyboardDidDisappear:(id)sender{
    
    UIView *containerView = (UIView *)[self.view viewWithTag:1];
    
    [UIView beginAnimations:nil context:NULL];
    containerView.frame = CGRectMake(containerView.frame.origin.x, 0, containerView.frame.size.width, containerView.frame.size.height);
    [UIView commitAnimations];
}

-(void)loginRequestDone:(id)sender{
    NSLog(@"test");
    
    [self dismissModalController:sender];
    
    /*if ([[[[Data sharedInstance] loginData] allKeys] containsObject:@"data"]) {
        [self dismissModalController:sender];
    }
    
    else if ([[[[Data sharedInstance] loginData] allKeys] containsObject:@"error"]){
        
    }*/
}

@end
