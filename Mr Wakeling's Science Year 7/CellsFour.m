//
//  CellsFour.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 04/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CellsFour.h"

@interface CellsFour ()

@end

@implementation CellsFour
@synthesize nucleus;
@synthesize cellWall;
@synthesize cellMembrane;
@synthesize chloroplast;
@synthesize cytoplasm;
@synthesize vacuole;
@synthesize nucleusTick;
@synthesize cellWallTick;
@synthesize cellMembraneTick;
@synthesize chloroplastTick;
@synthesize cytoplasmTick;
@synthesize vacuoleTick;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSDictionary *)getTheDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CellsFour" ofType:@"plist"];
    theDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return theDictionary;
}

-(UILabel *)getTheLabel
{
    // name this whatever the label is called in the nib
    
    return theScoreLabel;
    
}

-(NSArray *)theMovingImageViews
{
    //   theImageViews = [[NSArray alloc] initWithObjects:first, second, third, nil];
    theButtons = [[NSArray alloc] initWithObjects:nucleus, cellWall, cellMembrane, chloroplast, cytoplasm, vacuole, nil];
    
    return theButtons;
}

-(NSArray *)getTheTicks
{
    theTicks = [[NSArray alloc] initWithObjects:nucleusTick, cellWallTick, cellMembraneTick, chloroplastTick, cytoplasmTick, vacuoleTick ,nil];
    return theTicks;
}

-(NSArray *)getTheButtons
{
    theButtons = [[NSArray alloc] initWithObjects:nucleus, cellWall, cellMembrane, chloroplast, cytoplasm, vacuole, nil];
    return theButtons;
}

-(IBAction)clickingTheSaveButton
{
    if (theScore == 6) {
        CellsFourViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"CellsFourTest"];
        
        [self.navigationController pushViewController:detail animated:YES];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setNucleus:nil];
    [self setCellWall:nil];
    [self setCellMembrane:nil];
    [self setChloroplast:nil];
    [self setCytoplasm:nil];
    [self setVacuole:nil];
    [self setNucleusTick:nil];
    [self setCellWallTick:nil];
    [self setCellMembraneTick:nil];
    [self setChloroplastTick:nil];
    [self setCytoplasmTick:nil];
    [self setVacuoleTick:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
