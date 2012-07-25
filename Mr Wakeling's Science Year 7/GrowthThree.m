//
//  GrowthThree.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 24/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GrowthThree.h"

@interface GrowthThree ()

@end

@implementation GrowthThree
@synthesize copying;
@synthesize dividing;
@synthesize daughterCells;
@synthesize copyingTick;
@synthesize divideTick;
@synthesize daughterTick;
@synthesize theScoreLabel;
@synthesize theGrowthThreeModel;

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
    allTextFields = [[NSArray alloc] initWithObjects:copying, dividing, daughterCells, nil];
    allOfTheTextStrings = [[NSArray alloc] initWithObjects:copyingString, dividingString, daughterString, nil];
    theUserDefaultKeys = [[NSArray alloc] initWithObjects:@"copyingKey", @"dividingKey", @"daughterKey", nil];
    allTickImages = [[NSArray alloc] initWithObjects:copyingTick, divideTick, daughterTick, nil];
}

-(UILabel *)justReturnTheLabelObject
{
    return  theScoreLabel;
}

-(NSArray *)LowTextFieldsThatNeedTheViewToMove
{
    theTextFieldsThatNeedMoving = [[NSArray alloc] initWithObjects:daughterCells, nil];
    
    return theTextFieldsThatNeedMoving;
}

-(void)retrieveTheModelClass
{
    theGrowthThreeModel = [[GrowthThreeModel alloc] init];
}

-(NSDictionary *)retrieveTheModelDictionary
{
    [self retrieveTheModelClass];
    [theGrowthThreeModel getTheModelDictionary];
    theModelDictionary = theGrowthThreeModel.theModelDictionary;
    
    return theModelDictionary;
}

-(IBAction)transitionToAnotherController
{
    if (theScore == [allTextFields count]) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Growth3" object:self];
    }
}

- (void)viewDidLoad
{
    [self retrieveTheModelDictionary];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setCopying:nil];
    [self setDividing:nil];
    [self setDaughterCells:nil];
    [self setCopyingTick:nil];
    [self setDivideTick:nil];
    [self setDaughterTick:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
