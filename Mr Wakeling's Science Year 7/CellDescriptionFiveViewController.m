//
//  CellDescriptionFiveViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CellDescriptionFiveViewController.h"

@interface CellDescriptionFiveViewController ()

@end

@implementation CellDescriptionFiveViewController
@synthesize nucleusLabel;
@synthesize cellMembraneLabel;
@synthesize cytoplasmLabel;
@synthesize cellWallLabel;
@synthesize chloroplastLabel;
@synthesize vacuoleLabel;
@synthesize hidden;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)hideShowLabels
{
    NSArray *allTheLabels = [[NSArray alloc] initWithObjects:nucleusLabel, cellMembraneLabel, cytoplasmLabel, cellWallLabel, chloroplastLabel, vacuoleLabel, nil];
    
    for (UILabel *theLabel in allTheLabels) {
        if (theLabel.isHidden == YES) {
            theLabel.hidden = NO;
        }
        else {
            theLabel.hidden = YES; 
        }
    }
}

- (void)viewDidUnload
{
    [self setNucleusLabel:nil];
    [self setCellMembraneLabel:nil];
    [self setCytoplasmLabel:nil];
    [self setCellWallLabel:nil];
    [self setChloroplastLabel:nil];
    [self setVacuoleLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
