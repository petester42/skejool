//
//  MasterViewController.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MasterViewController.h"
#import "AppDelegate.h"

@implementation MasterViewController

@synthesize table;
@synthesize header;

- (void)dealloc
{
    [table release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self.view setBackgroundColor:[UIColor clearColor]];

    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, 748-50)];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = [UIColor clearColor];
    table.backgroundView = nil;
    table.separatorColor = [UIColor clearColor];
   /* [table.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [table.layer setShadowOffset:CGSizeMake(0, 0)];
    [table.layer setShadowOpacity:0.75];
    [table.layer setShadowRadius:10.0f];
    table.layer.masksToBounds = NO;
    */
    
    [self.view addSubview:table];
    
    header = [[NavigationHeader alloc] initWithFrame:CGRectMake(0, 0, 320, 50) withSettings:YES andBack:NO];
    header.title.text = [[[Data sharedInstance] loginData] userID];
    
    [self.view addSubview:header];
    [header release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"dismissPopover" object:nil];    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [header addObserver];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    
    [header removeObserver];

}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return [Helper getInterfaceOrientation:interfaceOrientation];
}

#pragma Table View Methods
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headerView = [[[UIView alloc] init] autorelease];
    
    return headerView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *headerView = [[[UIView alloc] init] autorelease];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 40.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    Data *data = [Data sharedInstance];
    return [data.mainMenu count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Data *data = [Data sharedInstance];
    return [[data.mainMenu objectAtIndex:section] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    Data *data = [Data sharedInstance];
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        if ([[data.mainMenu objectAtIndex:indexPath.section] count] == 1) {
            cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:3] autorelease];
        }
        
        else {
            if (indexPath.row == 0) {
                cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:1] autorelease];
            }
            
            else if (indexPath.row == [[data.mainMenu objectAtIndex:indexPath.section] count]-1){
                cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:2] autorelease];
            }
            
            else {
                cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:0] autorelease];
            }
        }
        
        cell.isRequest = [[[[data.mainMenu objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"request"] boolValue];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell.
    
    cell.textLabel.text = [[[data.mainMenu objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"text"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];

    if (indexPath.section == 0 && indexPath.row == 0) {
    
        [Proxy getSequenceForUser:[[[Data sharedInstance] loginData] userID] withSession:[[[Data sharedInstance] loginData] sessionID]];
    }
    
    else if (indexPath.section == 0 && indexPath.row == 1) {
        [Proxy getCoursesForUser:[[[Data sharedInstance] loginData] userID] withSession:[[[Data sharedInstance] loginData] sessionID]];
    }
    
    else if (indexPath.section == 1 && indexPath.row == 0) {
        [Proxy getSchedulesForUser:[[[Data sharedInstance] loginData] userID] withSession:[[[Data sharedInstance] loginData] sessionID]];
    }
    
    else if (indexPath.section == 1 && indexPath.row == 1) {
        
        GenerateScheduleViewController *controller = [[[GenerateScheduleViewController alloc] init] autorelease];

        [self.navigationController pushViewController:controller animated:YES];
        [[Helper getDetailViewContoller] switchToNoActionAnimated:YES];
        
        [table deselectRowAtIndexPath:indexPath animated:YES];
    }
    
    else {
       //nothing selected
    }
}

@end
