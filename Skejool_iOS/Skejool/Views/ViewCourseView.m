//
//  ViewCourseView.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewCourseView.h"

@implementation ViewCourseView

@synthesize table;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, viewWidth-20, viewHeight-20)];
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = LIGHT_GRAY;
        table.separatorColor = MEDIUM_GRAY;
        [table.layer setCornerRadius:10.0];

        /*
        [table.layer setShadowColor:[[UIColor blackColor] CGColor]];
        [table.layer setShadowOffset:CGSizeMake(0, 0)];
        [table.layer setShadowOpacity:0.75];
        [table.layer setShadowRadius:10.0f];
        table.layer.masksToBounds = NO;
        */
        [self addSubview:table];
    }
        
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [[[Data sharedInstance] Courses] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[[[Data sharedInstance] Courses] objectAtIndex:section] objectForKey:@"data"] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 37;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    TableHeaderView *header = [[[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 37)] autorelease];
    [header addSingleLabel];
    header.title.text = [[[[Data sharedInstance] Courses] objectAtIndex:section] objectForKey:@"header"];
    
    return header; 
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    CourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[CourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell setUpCell:[[[[[Data sharedInstance] Courses] objectAtIndex:indexPath.section] objectForKey:@"data"] objectAtIndex:indexPath.row]];

    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
