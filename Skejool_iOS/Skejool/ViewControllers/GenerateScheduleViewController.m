//
//  MasterViewController.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-02-28.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GenerateScheduleViewController.h"

@implementation GenerateScheduleViewController

@synthesize table;
@synthesize header;
@synthesize row,section;

- (void)dealloc
{    
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
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(schedulesRecieved:) 
                                                 name:@"getGenerateSchedulesRequestDone" object:nil];

    [self.view setBackgroundColor:[UIColor clearColor]];
    
    table = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 320, 748-50)];
    table.delegate = self;
    table.dataSource = self;
    table.backgroundColor = [UIColor clearColor];
    table.backgroundView = nil;
    table.separatorColor = [UIColor clearColor];
    /*  [table.layer setShadowColor:[[UIColor blackColor] CGColor]];
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
    
    row = -1;
    section = -1;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"getGenerateSchedulesRequestDone" object:nil];    

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
    return [data.generateScheduleMenu count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)_section
{
    Data *data = [Data sharedInstance];
    return [[data.generateScheduleMenu objectAtIndex:_section] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    Data *data = [Data sharedInstance];
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        if ([[data.generateScheduleMenu objectAtIndex:indexPath.section] count] == 1) {
            cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:3] autorelease];
        }
        
        else {
            if (indexPath.row == 0) {
                cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:1] autorelease];
            }
            
            else if (indexPath.row == [[data.generateScheduleMenu objectAtIndex:indexPath.section] count]-1){
                cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:2] autorelease];
            }
            
            else {
                cell = [[[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier withType:0] autorelease];
            }
        }
        
        cell.isRequest = [[[[data.generateScheduleMenu objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"request"] boolValue];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    // Configure the cell.
    
    cell.textLabel.text = [[[data.generateScheduleMenu objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectForKey:@"text"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       
    if (indexPath.section == 0 && indexPath.row == 0) {
        section = indexPath.section;
        row = indexPath.row;

        [[Helper getDetailViewContoller] performSelector:@selector(getTimeConstraints:)];
    }
    
    else if (indexPath.section == 0 && indexPath.row == 1) {
        section = indexPath.section;
        row = indexPath.row;

        [[Helper getDetailViewContoller] performSelector:@selector(getCreditConstraints:)];
    }
    
    else if (indexPath.section == 1 && indexPath.row == 0){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:CLEAR_CONSTRAINTS_ALERT_TITLE message:CLEAR_CONSTRAINTS_ALERT_MESSAGE delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alert show];
        [alert release];

    }
    
    if (indexPath.section == 2) {
        section = indexPath.section;
        row = indexPath.row;

        [Proxy getGeneratedSchedulesForUser:[[[Data sharedInstance] loginData] userID] withSession:[[[Data sharedInstance] loginData] sessionID]];
        
    }
}

-(void)goBack:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [[Helper getDetailViewContoller] switchToNoActionAnimated:YES];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0) {

    }
    
    else if (buttonIndex == 1){
        [[Data sharedInstance] clearConstraints];
                
    }
    
    else {
        
    }
    
    [self reselectCell];
}

-(void)reselectCell{

    if (row == 0 && section == 0) {
        [self.table selectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section] animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
    
    else if (row == 1 && section == 0){
        [self.table selectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section] animated:YES scrollPosition:UITableViewScrollPositionTop];
    }
    
    else {
        [table deselectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1] animated:YES];
    }
}


-(void)schedulesRecieved:(id)sender{
    SelectScheduleViewController *controller = [[[SelectScheduleViewController alloc] init] autorelease];
    
    [self.navigationController pushViewController:controller animated:YES];
    
    [table deselectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:section] animated:YES];
    [[Helper getDetailViewContoller] switchToNoActionAnimated:YES];
}

@end
