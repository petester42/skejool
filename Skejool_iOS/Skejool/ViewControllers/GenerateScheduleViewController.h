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
#import "SelectScheduleViewController.h"

@interface GenerateScheduleViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, BackDelegate>{
    
    UITableView *table;
    NavigationHeader *header;
    int row;
    int section;
}

@property (strong, nonatomic) UITableView *table;
@property (strong, nonatomic) NavigationHeader *header;
@property (nonatomic) int row;
@property (nonatomic) int section;

-(void)schedulesRecieved:(id)sender;
-(void)reselectCell;

@end
