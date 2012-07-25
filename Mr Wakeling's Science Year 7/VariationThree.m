//
//  VariationThree.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 25/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VariationThree.h"

@interface VariationThree ()

@end

@implementation VariationThree
@synthesize sizeField;
@synthesize colourField;
@synthesize genderField;
@synthesize sizeTick;
@synthesize colourTick;
@synthesize genderTick;

@synthesize theScoreLabel;
@synthesize theVariationThreeModel;

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
    allTextFields = [[NSArray alloc] initWithObjects:sizeField, colourField, genderField, nil];
    allOfTheTextStrings = [[NSArray alloc] initWithObjects:sizeString, colourString, genderString, nil];
    theUserDefaultKeys = [[NSArray alloc] initWithObjects:@"sizeKey", @"colourKey", @"genderKey", nil];
    allTickImages = [[NSArray alloc] initWithObjects:sizeTick, colourTick, genderTick, nil];
}

-(UILabel *)justReturnTheLabelObject
{
    return theScoreLabel;
}

-(NSArray *)LowTextFieldsThatNeedTheViewToMove
{
    theTextFieldsThatNeedMoving = [[NSArray alloc] initWithObjects:sizeField, colourField, genderField, nil];
    return theTextFieldsThatNeedMoving;
}

-(void)retrieveTheModelClass
{
    theVariationThreeModel = [[VariationThreeModel alloc] init];
}

-(NSDictionary *)retrieveTheModelDictionary
{
    [self retrieveTheModelClass];
    [theVariationThreeModel getTheModelDictionary];
    theModelDictionary = theVariationThreeModel.theModelDictionary;
    
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
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"VariationTypes3" object:self];
    }
}

- (void)viewDidUnload
{
    [self setSizeField:nil];
    [self setColourField:nil];
    [self setGenderField:nil];
    [self setSizeTick:nil];
    [self setColourTick:nil];
    [self setGenderTick:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
