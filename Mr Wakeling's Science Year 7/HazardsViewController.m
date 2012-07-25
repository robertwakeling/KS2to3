//
//  HazardsViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HazardsViewController.h"

@interface HazardsViewController ()

@end

@implementation HazardsViewController
@synthesize harmful;
@synthesize irritant;
@synthesize flammable;
@synthesize toxic;
@synthesize oxidising;
@synthesize corrosive;
@synthesize harmfulTick;
@synthesize irritantTick;
@synthesize flammableTick;
@synthesize toxicTick;
@synthesize oxidisingTick;
@synthesize corrosiveTick;
@synthesize hazardsLabel;

@synthesize theHazardModel;

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
    allTextFields = [[NSArray alloc] initWithObjects:harmful, irritant, flammable, toxic, oxidising, corrosive, nil];
    allOfTheTextStrings = [[NSArray alloc] initWithObjects:harmfulString, irritantString, flammableString, toxicString, oxidisingString, corrosiveString, nil];
    theUserDefaultKeys = [[NSArray alloc] initWithObjects:@"harmfulKey",@"irritantKey",@"flammableKey",@"toxicKey",@"oxidisingKey",@"corrosiveKey", nil];
    allTickImages = [[NSArray alloc] initWithObjects:harmfulTick, irritantTick, flammableTick, toxicTick, oxidisingTick, corrosiveTick, nil];
}

-(UILabel *)justReturnTheLabelObject
{
    return hazardsLabel;
}

-(NSArray *)LowTextFieldsThatNeedTheViewToMove
{
    theTextFieldsThatNeedMoving = [[NSArray alloc] initWithObjects:oxidising, corrosive, nil];
    return theTextFieldsThatNeedMoving;
}

-(void)retrieveTheModelClass
{
    theHazardModel = [[HazardModel alloc] init];
}

-(NSDictionary *)retrieveTheModelDictionary
{
    [self retrieveTheModelClass];
    [theHazardModel getTheModelDictionary];
    theModelDictionary = theHazardModel.theModelDictionary;
    
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
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AcidSafety3" object:self];
    }
}

- (void)viewDidUnload
{
    [self setHarmful:nil];
    [self setIrritant:nil];
    [self setFlammable:nil];
    [self setToxic:nil];
    [self setOxidising:nil];
    [self setCorrosive:nil];
    [self setHarmfulTick:nil];
    [self setIrritantTick:nil];
    [self setFlammableTick:nil];
    [self setToxicTick:nil];
    [self setOxidisingTick:nil];
    [self setCorrosiveTick:nil];
    [self setHazardsLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
