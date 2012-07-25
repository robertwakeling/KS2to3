//
//  IndicatorsThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 06/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IndicatorsThreeViewController.h"

@interface IndicatorsThreeViewController ()

@end

@implementation IndicatorsThreeViewController
@synthesize acid;
@synthesize acidTick;
@synthesize neutral;
@synthesize neutralTick;
@synthesize alkali;
@synthesize alkaliTick;
@synthesize universalIndicator;
@synthesize universalTick;
@synthesize red;
@synthesize redTick;
@synthesize orange;
@synthesize orangeTick;
@synthesize yellow;
@synthesize yellowTick;
@synthesize green;
@synthesize greenTick;
@synthesize blue;
@synthesize blueTick;
@synthesize indigo;
@synthesize indigoTick;
@synthesize violet;
@synthesize violetTick;
@synthesize theScoreLabel;
@synthesize theIndicatorThreeModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(UILabel *)justReturnTheLabelObject
{
    return theScoreLabel;
}

-(NSArray *)LowTextFieldsThatNeedTheViewToMove
{
    return nil;
}

-(void)retrieveTheModelClass
{
    theIndicatorThreeModel = [[IndicatorThreeModel alloc] init];
}

-(NSDictionary *)retrieveTheModelDictionary
{
    [self retrieveTheModelClass];
    [theIndicatorThreeModel getTheDictionary];
    theModelDictionary = theIndicatorThreeModel.theModelDictionary;
    
    return theModelDictionary;
}



-(void)preparationOfTextFields_TickImages_TextStringsAndUserDefaultKeys
{
    allTextFields = [[NSArray alloc] initWithObjects:acid, neutral, alkali, universalIndicator, red, orange, yellow, green, blue, indigo, violet, nil];
    allOfTheTextStrings = [[NSArray alloc] initWithObjects:acidString, neutralString, alkaliString, universalString, redString, orangeString, yellowString, greenString, blueString, indigoString, violetString, nil];
    theUserDefaultKeys = [[NSArray alloc] initWithObjects:@"acidKey", @"neutralKey", @"alkaliKey", @"universalKey", @"redKey", @"orangeKey", @"yellowKey", @"greenKey", @"blueKey", @"indigoKey", @"violetKey", nil];
    allTickImages = [[NSArray alloc] initWithObjects:acidTick, neutralTick, alkaliTick, universalTick, redTick, orangeTick, yellowTick, greenTick, blueTick, indigoTick, violetTick, nil];
}

-(IBAction)transitionToAnotherController
{
    if (theScore == [allTextFields count]) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Indicators3" object:self];
        

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
    [self setAcid:nil];
    [self setNeutral:nil];
    [self setAlkali:nil];
    [self setUniversalIndicator:nil];
    [self setRed:nil];
    [self setOrange:nil];
    [self setYellow:nil];
    [self setGreen:nil];
    [self setBlue:nil];
    [self setIndigo:nil];
    [self setViolet:nil];
    [self setTheScoreLabel:nil];
    [self setAcidTick:nil];
    [self setNeutralTick:nil];
    [self setAlkaliTick:nil];
    [self setUniversalTick:nil];
    [self setRedTick:nil];
    [self setOrangeTick:nil];
    [self setYellowTick:nil];
    [self setGreenTick:nil];
    [self setBlueTick:nil];
    [self setIndigoTick:nil];
    [self setVioletTick:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
