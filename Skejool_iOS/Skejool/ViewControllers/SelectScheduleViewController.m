//
//  MasterViewController.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SelectScheduleViewController.h"

@implementation SelectScheduleViewController

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
    
    header = [[NavigationHeader alloc] initWithFrame:CGRectMake(0, 0, 320, 50) withSettings:YES andBack:YES];
    header.backDelegate = self;
    header.title.text = [[[Data sharedInstance] loginData] userID];

    [self.view addSubview:header];
    [header release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
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
    [HUD hide:YES];
    HUD.delegate = nil;
    // [HUD release];
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
    
    if (section == 0) {
        return 40.0;
    }

    return 20.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if (section == [[[Data sharedInstance] GeneratedSchedules] count] - 1) {
        return 40.0;
    }
    
    return 0.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning may not be completely implemented
    return [[[Data sharedInstance] GeneratedSchedules] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning may not be completely implemented
    return 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
        
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:3] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell.
    
    cell.textLabel.text = [NSString stringWithFormat:@"Schedule %i",indexPath.section+1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    [self.table addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"Crunching Numbers";
    
    NSNumber *index = [[NSNumber alloc] initWithInt:indexPath.section];
    
    [[Helper getDetailViewContoller] performSelector:@selector(getScheduleForIndex:) withObject:index];
//    [HUD showWhileExecuting:@selector(scheduleForIndex:) onTarget:self withObject:(id)index animated:YES];
    
    [index release];
}

-(void)scheduleForIndex:(id)index{
    [[Helper getDetailViewContoller] performSelectorOnMainThread:@selector(getScheduleForIndex:) withObject:index waitUntilDone:YES];
}

-(void)goBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [[Helper getDetailViewContoller] switchToNoActionAnimated:YES];
}

#pragma mark MBProgressHUDDelegate methods

- (void)hudWasHidden:(MBProgressHUD *)hud {
    // Remove HUD from screen when the HUD was hidded
    
    [HUD removeFromSuperview];
    [HUD release];
    HUD = nil;
}

@end
