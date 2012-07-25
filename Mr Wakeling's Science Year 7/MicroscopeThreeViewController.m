//
//  MicroscopeThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MicroscopeThreeViewController.h"

@interface MicroscopeThreeViewController ()

@end

@implementation MicroscopeThreeViewController
@synthesize eyepiece;
@synthesize objectiveLenses;
@synthesize focussingKnobs;
@synthesize stage;
@synthesize mirror;
@synthesize eyepieceTick;
@synthesize objectiveTick;
@synthesize focussingTick;
@synthesize stageTick;
@synthesize mirrorTick;
@synthesize microscopeScoreLabel;
@synthesize theMicroscopeModel;



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
    allTextFields = [[NSArray alloc] initWithObjects:eyepiece, objectiveLenses, focussingKnobs, stage, mirror, nil];
    allOfTheTextStrings = [[NSArray alloc] initWithObjects:eyepieceString, objectiveString, focussingString, stageString, mirrorString, nil];
    theUserDefaultKeys = [[NSArray alloc] initWithObjects:@"eyepieceKey", @"objectiveKey", @"focussingKey", @"stageKey", @"mirrorKey", nil];
    allTickImages = [[NSArray alloc] initWithObjects:eyepieceTick, objectiveTick, focussingTick, stageTick, mirrorTick, nil];
}

-(UILabel *)justReturnTheLabelObject
{
    return microscopeScoreLabel;
}

-(NSArray *)LowTextFieldsThatNeedTheViewToMove
{
    theTextFieldsThatNeedMoving = [[NSArray alloc] initWithObjects:mirror, nil];
    return theTextFieldsThatNeedMoving;
}

-(void)retrieveTheModelClass
{
    theMicroscopeModel = [[MicroscopeModel alloc] init];
}

//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    float redColour = arc4random() % 255/255.0f;
//    float greenColour = arc4random() % 255/255.0f;
//    float blueColour = arc4random() % 255/255.0f;
//
//    textField.textColor = [UIColor colorWithRed:redColour green:greenColour blue:blueColour alpha:1];
//}

-(NSDictionary *)retrieveTheModelDictionary
{
    [self retrieveTheModelClass];
    [theMicroscopeModel getTheDictionary];
    theModelDictionary = theMicroscopeModel.theModelDictionary;

    return theModelDictionary;
}

- (void)viewDidLoad
{
    [self retrieveTheModelDictionary];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
    

-(void)transitionToAnotherController
{
    if (theScore == [allTextFields count]) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];

        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Microscopes3" object:self];

        
    }
}

- (void)viewDidUnload
{
    [self setEyepiece:nil];
    [self setObjectiveLenses:nil];
    [self setFocussingKnobs:nil];
    [self setStage:nil];
    [self setMirror:nil];
    [self setStageTick:nil];
    [self setObjectiveTick:nil];
    [self setFocussingTick:nil];
    [self setStageTick:nil];
    [self setMirrorTick:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
