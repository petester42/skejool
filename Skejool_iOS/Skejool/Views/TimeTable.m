//
//  TimeTable.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-07.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TimeTable.h"

@implementation TimeTable

@synthesize table, scroll, classesView, selection, allDayView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        [[self layer] setCornerRadius:10.0];
        [[self layer] setMasksToBounds:YES];
        
        TableHeaderView *header = [[[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, section_height)] autorelease];
        [header addTimeTabelLabelsWithWidth:frame.size.width andHeight:section_height];
        
        scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, section_height, frame.size.width, frame.size.height-section_height)];
        scroll.delegate = self;
        [scroll setAutoresizesSubviews:YES];
        [scroll setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        scroll.contentSize = CGSizeMake(frame.size.width, cell_height*[[[Data sharedInstance] time] count]);
        scroll.alwaysBounceVertical = YES;
        scroll.scrollsToTop = NO;
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, scroll.frame.size.width, scroll.frame.size.height)];
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = LIGHT_GRAY;
        table.separatorColor = MEDIUM_GRAY;
        table.scrollEnabled = NO;
        table.scrollsToTop = NO;
        
        classesView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scroll.contentSize.width, scroll.contentSize.height)];
        classesView.userInteractionEnabled = NO;
        
        [scroll addSubview:table];
        [scroll addSubview:classesView];
        
        [self addSubview:scroll];
        [self addSubview:header];
        
    }
    
    return self;
}

- (id)initWithFrameForConstraints:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        [[self layer] setCornerRadius:10.0];
        [[self layer] setMasksToBounds:YES];
        
        TableHeaderView *header = [[[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, section_height)] autorelease];
        [header addTimeTabelLabelsWithWidth:frame.size.width andHeight:section_height];
        
        allDayView = [[[AllDayView alloc] initWithFrame:CGRectMake(header.frame.origin.x,header.frame.origin.y + header.frame.size.height, frame.size.width,section_height)] autorelease];
        allDayView.backgroundColor = LIGHT_GRAY;
        
        scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, allDayView.frame.origin.y + allDayView.frame.size.height, frame.size.width, frame.size.height-(allDayView.frame.origin.y + allDayView.frame.size.height))];
        scroll.delegate = self;
        [scroll setAutoresizesSubviews:YES];
        [scroll setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
        scroll.contentSize = CGSizeMake(frame.size.width, cell_height*[[[Data sharedInstance] time] count]);
        scroll.alwaysBounceVertical = YES;
        scroll.scrollsToTop = NO;
        
        table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, scroll.frame.size.width, scroll.frame.size.height)];
        table.delegate = self;
        table.dataSource = self;
        table.backgroundColor = LIGHT_GRAY;
        table.separatorColor = MEDIUM_GRAY;
        table.scrollEnabled = NO;
        table.scrollsToTop = NO;
        
        allDayView.timeTable = table;
        
        classesView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, scroll.contentSize.width, scroll.contentSize.height)];
        classesView.userInteractionEnabled = NO;
        
        [scroll addSubview:table];
        [scroll addSubview:classesView];
        
        [self addSubview:scroll];
        [self addSubview:allDayView];
        [self addSubview:header];
        
    }
    
    return self;
}

#pragma mark - Scroll view delegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    table.frame = CGRectMake(0, scroll.contentOffset.y, table.frame.size.width, table.frame.size.height);
    table.contentOffset = scroll.contentOffset;   
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[Data sharedInstance] time] count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return cell_height;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil; 
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"row:%i",indexPath.row];
    
    TimeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[TimeTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell initWithWidth:(int)table.frame.size.width andHeight:(int)[self tableView:tableView heightForRowAtIndexPath:indexPath] andSelection:selection atPosition:(int)indexPath.row];
    }
    
    [cell setUpCell:[[[Data sharedInstance] time] objectAtIndex:indexPath.row]];
    
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

#pragma mark - instance methods

-(void)setUpSchedule:(Schedule *)schedule{
    
    NSMutableArray *colors = [[[Data sharedInstance] colors] mutableCopy];
    
    NSDateFormatter *timeFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [timeFormatter setTimeStyle:NSDateFormatterShortStyle];
    [timeFormatter setDateStyle:NSDateFormatterNoStyle];
    
    NSLocale *frLocale = [[[NSLocale alloc] initWithLocaleIdentifier:@"fr_FR"] autorelease];
    [timeFormatter setLocale:frLocale];
    
    NSDate *earliest = [[[NSDate alloc] init] autorelease];
    
    for (Course *course in schedule.courses) {
        
        int x = arc4random() % [colors count];
        
        course.color = [Helper getColor:[colors objectAtIndex:x]];
        [colors removeObjectAtIndex:x];
        
        int index = 0;
        
        for (Time *time in course.time) {
            
            earliest = [earliest earlierDate:[timeFormatter dateFromString:time.startTime]];
        
            int width = classesView.frame.size.width;
                        
            CGRect rect = [Helper getFrameForTime:time withWidth:width]; 
            
            ClassView *class = [[ClassView alloc] initWithFrame:rect andCourse:course atTime:time];
            
            CGColorRef color = [course.color CGColor];
            
            int numComponents = CGColorGetNumberOfComponents(color);
            
            CGFloat red = 0.0;
            CGFloat green = 0.0;
            CGFloat blue = 0.0;
            CGFloat alpha = 1.0;

            if (numComponents == 4){
                
                const CGFloat *components = CGColorGetComponents(color);
                red = components[0];
                green = components[1];
                blue = components[2];
                alpha = components[3];
            }
            
            class.startColor = course.color;
            class.endColor = [UIColor colorWithRed:red*.80 green:green*.80 blue:blue*.80 alpha:alpha];
            
            [classesView addSubview:class];
            
            [class release];
            
            index++;
        }
    }
    
    [colors release];

    [scroll scrollRectToVisible:[Helper getFrameToScrollForTime:earliest withHeight:scroll.frame.size.height] animated:NO];
}

@end
