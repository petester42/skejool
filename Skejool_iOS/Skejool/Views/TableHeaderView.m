//
//  TableHeaderView.m
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TableHeaderView.h"

@implementation TableHeaderView

@synthesize title;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code       
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, frame.size.height-1, frame.size.width, 1)];
        line.backgroundColor = DARK_GRAY;
        
        [self addSubview:line];
        
        [line release];
    }
    
    return self;
}

-(void)addSingleLabel{
    
    title = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.height)];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
    title.textColor = [UIColor whiteColor];
    
    [self addSubview:title];
    
    [title release];
}

-(void)addTimeTabelLabelsWithWidth:(int)width andHeight:(int)height{
    
   /* CALayer *capa = self.layer;
    CGRect bounds = capa.bounds;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bounds 
                                         byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                               cornerRadii:CGSizeMake(10.0, 10.0)];

    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = bounds;
    maskLayer.path = maskPath.CGPath;
    
    capa.mask = maskLayer;
*/
    /*UIView *time = [[UIView alloc] initWithFrame:CGRectMake(75, 0, 1, height)];
    time.backgroundColor = MEDIUM_GRAY;
    */
    int origin = 75;
    width = (width - origin)/5;
    
    UILabel *monday = [[UILabel alloc] initWithFrame:CGRectMake(origin+1, 0, width, height)];
    monday.backgroundColor = [UIColor clearColor];
    monday.textAlignment = UITextAlignmentCenter;
    monday.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
    monday.textColor = [UIColor whiteColor];
    monday.text = @"Monday";
    
    UILabel *tuesday = [[UILabel alloc] initWithFrame:CGRectMake(origin+1 + width, 0, width, height)];
    tuesday.backgroundColor = [UIColor clearColor];
    tuesday.textAlignment = UITextAlignmentCenter;
    tuesday.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
    tuesday.textColor = [UIColor whiteColor];
    tuesday.text = @"Tuesday";
    
    UILabel *wednesday = [[UILabel alloc] initWithFrame:CGRectMake(origin+1 + width*2, 0, width, height)];
    wednesday.backgroundColor = [UIColor clearColor];
    wednesday.textAlignment = UITextAlignmentCenter;
    wednesday.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
    wednesday.textColor = [UIColor whiteColor];
    wednesday.text = @"Wednesday";
    
    UILabel *thursday = [[UILabel alloc] initWithFrame:CGRectMake(origin+1 + width*3, 0, width, height)];
    thursday.backgroundColor = [UIColor clearColor];
    thursday.textAlignment = UITextAlignmentCenter;
    thursday.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
    thursday.textColor = [UIColor whiteColor];
    thursday.text = @"Thursday";
    
    UILabel *friday = [[UILabel alloc] initWithFrame:CGRectMake(origin+1 + width*4, 0, width, height)];
    friday.backgroundColor = [UIColor clearColor];
    friday.textAlignment = UITextAlignmentCenter;
    friday.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
    friday.textColor = [UIColor whiteColor];
    friday.text = @"Friday";
    
    [self addSubview:monday];
    [self addSubview:tuesday];
    [self addSubview:wednesday];
    [self addSubview:thursday];
    [self addSubview:friday];
    
    [monday release];
    [tuesday release];
    [wednesday release];
    [thursday release];
    [friday release];
        
    UIView *line0 = [[UIView alloc] initWithFrame:CGRectMake(origin, 0, 1, height)];
    line0.backgroundColor = DARK_GRAY;
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(width + origin, 0, 1, height)];
    line1.backgroundColor = DARK_GRAY;
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(width*2 + origin, 0, 1, height)];
    line2.backgroundColor = DARK_GRAY;
    
    UIView *line3 = [[UIView alloc] initWithFrame:CGRectMake(width*3 + origin, 0, 1, height)];
    line3.backgroundColor = DARK_GRAY;
    
    UIView *line4 = [[UIView alloc] initWithFrame:CGRectMake(width*4 + origin, 0, 1, height)];
    line4.backgroundColor = DARK_GRAY;
    
    [self addSubview:line0];
    [self addSubview:line1];
    [self addSubview:line2];
    [self addSubview:line3];
    [self addSubview:line4];
    
    [line0 release];
    [line1 release];
    [line2 release];
    [line3 release];
    [line4 release];
}

-(void)addCreditLabelsWithWidth:(int)width andHeight:(int)height{
    
    width = (width)/2;
    
    UILabel *min = [[UILabel alloc] initWithFrame:CGRectMake(1, 0, width-2, height)];
    min.backgroundColor = [UIColor clearColor];
    min.textAlignment = UITextAlignmentCenter;
    min.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
    min.textColor = [UIColor whiteColor];
    min.text = @"Minimum Credits";
    
    UILabel *max = [[UILabel alloc] initWithFrame:CGRectMake(1 + width, 0, width-2, height)];
    max.backgroundColor = [UIColor clearColor];
    max.textAlignment = UITextAlignmentCenter;
    max.font = [UIFont fontWithName:BOLD_FONT_NAME size:20];
    max.textColor = [UIColor whiteColor];
    max.text = @"Maximum Credits";

    [self addSubview:min];
    [self addSubview:max];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(width, 0, 1, height)];
    line.backgroundColor = DARK_GRAY;
    
    [self addSubview:line];
    
    [line release];
    [min release];
    [max release];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0, 1.0};
    
    NSArray *colors = [NSArray arrayWithObjects:(id)[LIGHT_RED CGColor], (id)[DARK_RED CGColor], nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef) colors, locations);
    
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


@end
