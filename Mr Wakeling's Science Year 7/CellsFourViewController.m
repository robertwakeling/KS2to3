//
//  CellsFourViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CellsFourViewController.h"

@interface CellsFourViewController ()

@end

@implementation CellsFourViewController
@synthesize nucleusField;
@synthesize cellWallField;
@synthesize cellMembraneField;
@synthesize chloroplastField;
@synthesize cytoplasmField;
@synthesize vacuoleField;
@synthesize nucleusTick;
@synthesize cellWallTick;
@synthesize cellMembraneTick;
@synthesize chloroplastTick;
@synthesize cytoplasmTick;
@synthesize vacuoleTick;
@synthesize theScoreLabel;
@synthesize theCellsFourModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)preparationOfTextFields_TickImages_TextStringsAndUserDefaultKeys
{
    allTextFields = [[NSArray alloc] initWithObjects:nucleusField, cellWallField, cellMembraneField, chloroplastField, cytoplasmField, vacuoleField, nil];
    allOfTheTextStrings = [[NSArray alloc] initWithObjects:nucleusString2, cellWallString2, cellMembraneString2, chloroplastString2, cytoplasmString2, vacuoleString2, nil];
    theUserDefaultKeys = [[NSArray alloc] initWithObjects:@"nucleusKey", @"cellWallKey", @"cellMembraneKey", @"chloroplastKey", @"cytoplasmKey", @"vacuole", nil];
    allTickImages = [[NSArray alloc] initWithObjects:nucleusTick, cellWallTick, cellMembraneTick, chloroplastTick, cytoplasmTick, vacuoleTick, nil];
}

-(UILabel *)justReturnTheLabelObject
{
    return theScoreLabel;
}

-(NSArray *)LowTextFieldsThatNeedTheViewToMove
{
    theTextFieldsThatNeedMoving = [[NSArray alloc] initWithObjects:cytoplasmField, vacuoleField, nil];
    return theTextFieldsThatNeedMoving;
}

-(void)retrieveTheModelClass
{
    theCellsFourModel = [[CellsFourModel alloc] init];
}

-(NSDictionary *)retrieveTheModelDictionary
{
    [self retrieveTheModelClass];
    [theCellsFourModel getTheModelDictionary];
    theModelDictionary = theCellsFourModel.theModelDictionary;
    
    return theModelDictionary;
}

- (void)viewDidLoad
{
    [self retrieveTheModelDictionary];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}



-(IBAction)transitionToAnotherController
{
    if (theScore == [allTextFields count]) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Cells4" object:self];
}
}

- (void)viewDidUnload
{
    [self setNucleusField:nil];
    [self setCellWallField:nil];
    [self setCellMembraneField:nil];
    [self setChloroplastField:nil];
    [self setCytoplasmField:nil];
    [self setVacuoleField:nil];
    [self setNucleusTick:nil];
    [self setCellWallTick:nil];
    [self setCellMembraneTick:nil];
    [self setChloroplastTick:nil];
    [self setCytoplasmTick:nil];
    [self setVacuoleTick:nil];
    [self setTheScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
