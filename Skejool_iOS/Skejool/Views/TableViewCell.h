//
//  TableViewCell.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell {
    
    UILabel *textLabel;
    UIView *background;
    UIActivityIndicatorView *activityIndicator;
    bool isRequest;
}

@property (strong, nonatomic) UILabel *textLabel;
@property (strong, nonatomic) UIView *background;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (nonatomic) bool isRequest;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withType:(int)type;
-(void)startActivity;
-(void)stopActivity;
-(void)stopActivityAndDeselect;

@end
