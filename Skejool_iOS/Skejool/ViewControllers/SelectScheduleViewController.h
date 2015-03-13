//
//  MasterViewController.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "NavigationHeader.h"
#import "MBProgressHUD.h"

@class DetailViewController;

@interface SelectScheduleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, BackDelegate, MBProgressHUDDelegate>{
    
    UITableView *table;
    NavigationHeader *header;
    MBProgressHUD *HUD;
}

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NavigationHeader *header;

-(void)scheduleForIndex:(id)index;

@end
