//
//  TableHeaderView.h
//  Skejool
//
//  Created by Pierre-Marc Airoldi on 12-03-02.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableHeaderView : UIView {
    UILabel *title;
}

@property (nonatomic, retain) UILabel *title;

-(void)addSingleLabel;
-(void)addTimeTabelLabelsWithWidth:(int)width andHeight:(int)height;
-(void)addCreditLabelsWithWidth:(int)width andHeight:(int)height;

@end
