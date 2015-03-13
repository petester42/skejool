//
//  MasterViewController.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"
#import "GenerateScheduleViewController.h"
#import "NavigationHeader.h"

@interface MasterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    
    UITableView *table;
    NavigationHeader *header;
}

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NavigationHeader *header;

@end
