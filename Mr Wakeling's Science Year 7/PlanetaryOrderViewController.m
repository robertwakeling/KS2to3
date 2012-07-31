//
//  PlanetaryOrderViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlanetaryOrderViewController.h"

@interface PlanetaryOrderViewController ()

@end

@implementation PlanetaryOrderViewController
@synthesize mercury;
@synthesize venus;
@synthesize earth;
@synthesize mars;
@synthesize jupiter;
@synthesize saturn;
@synthesize uranus;
@synthesize neptune;
@synthesize mercuryTick;
@synthesize venusTick;
@synthesize earthTick;
@synthesize marsTick;
@synthesize jupiterTick;
@synthesize saturnTick;
@synthesize uranusTick;
@synthesize neptuneTick;
@synthesize PlanetScoreLabel;

@synthesize thePlanetaryModel;

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
    allTextFields = [[NSArray alloc] initWithObjects:mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, nil];
    allOfTheTextStrings = [[NSArray alloc] initWithObjects:mercuryString, venusString, earthString, marsString, jupiterString, saturnString, uranusString, neptuneString, nil];
    theUserDefaultKeys = [[NSArray alloc] initWithObjects:@"mercuryKey",@"venusKey",@"earthKey",@"marsKey",@"jupiterKey",@"saturnKey",@"uranusKey",@"neptuneKey", nil];
    allTickImages = [[NSArray alloc] initWithObjects:mercuryTick, venusTick, earthTick, marsTick, jupiterTick, saturnTick, uranusTick, neptuneTick, nil];
}

-(UILabel *)justReturnTheLabelObject
{
    return PlanetScoreLabel;
}

-(NSArray *)LowTextFieldsThatNeedTheViewToMove
{
    theTextFieldsThatNeedMoving = [[NSArray alloc] initWithObjects:jupiter, saturn, uranus, neptune, nil];
    return theTextFieldsThatNeedMoving;
}

-(void)retrieveTheModelClass
{
    thePlanetaryModel = [[PlanetModel alloc] init];
}

-(NSDictionary *)retrieveTheModelDictionary
{
    [self retrieveTheModelClass];
    [thePlanetaryModel getTheModelDictionary];
    theModelDictionary = thePlanetaryModel.theModelDictionary;
    
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
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SolarSystem3" object:self];
    }
}

- (void)viewDidUnload
{
    [self setMercury:nil];
    [self setVenus:nil];
    [self setEarth:nil];
    [self setMars:nil];
    [self setJupiter:nil];
    [self setSaturn:nil];
    [self setUranus:nil];
    [self setNeptune:nil];
    [self setMercuryTick:nil];
    [self setVenusTick:nil];
    [self setEarthTick:nil];
    [self setMarsTick:nil];
    [self setJupiterTick:nil];
    [self setSaturnTick:nil];
    [self setUranusTick:nil];
    [self setNeptuneTick:nil];
    [self setPlanetScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
