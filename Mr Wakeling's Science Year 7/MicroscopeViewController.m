//
//  MicroscopeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MicroscopeViewController.h"
#import "OverallLevelThreeViewController.h"

@interface MicroscopeViewController ()

@end

@implementation MicroscopeViewController
@synthesize eyepiece;
@synthesize objectiveLenses;
@synthesize objectiveTick;
@synthesize focussingKnobs;
@synthesize focussingTick;
@synthesize stage;
@synthesize stageTick;
@synthesize mirror;
@synthesize mirrorTick;
@synthesize editing;
@synthesize microscopeScoreLabel;
@synthesize eyepieceTick;
@synthesize finalMicroscopeScore;

@synthesize microscopeBrain;
@synthesize theBigBrain;






- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(shiftViewUpForKeyboard:)
                                                 name: UIKeyboardWillShowNotification
                                               object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(shiftViewDownAfterKeyboard)
                                                 name: UIKeyboardWillHideNotification
                                               object: nil];
    
    
}

- (void) viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIKeyboardWillShowNotification
                                                  object: nil];
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIKeyboardWillHideNotification
                                                  object: nil];
    

}

- (void) shiftViewUpForKeyboard: (NSNotification*) theNotification;
{
    if(mirror.isEditing == YES)
    {
        
    CGRect keyboardFrame;
    NSDictionary* userInfo = theNotification.userInfo;
    keyboardSlideDuration = [[userInfo objectForKey: UIKeyboardAnimationDurationUserInfoKey] floatValue];
    keyboardFrame = [[userInfo objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    UIInterfaceOrientation theStatusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    if UIInterfaceOrientationIsLandscape(theStatusBarOrientation)
        keyboardShiftAmount = keyboardFrame.size.width;
    else 
        keyboardShiftAmount = keyboardFrame.size.height;
    
    [UIView beginAnimations: @"ShiftUp" context: nil];
    [UIView setAnimationDuration: keyboardSlideDuration];
    self.view.center = CGPointMake( self.view.center.x, self.view.center.y - keyboardShiftAmount);
    [UIView commitAnimations];
    viewShiftedForKeyboard = TRUE;
    }
}


//------------------

- (void) shiftViewDownAfterKeyboard;
{
    if (viewShiftedForKeyboard)
    {
        [UIView beginAnimations: @"ShiftUp" context: nil];
        [UIView setAnimationDuration: keyboardSlideDuration];
        self.view.center = CGPointMake( self.view.center.x, self.view.center.y + keyboardShiftAmount);
        [UIView commitAnimations];
        viewShiftedForKeyboard = FALSE;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField 
    {
        
        [textField resignFirstResponder];
    
        return NO;
}

-(IBAction)saveUserEntries {
    
    
    if (eyepiece.text != nil) {
        
        eyepieceString = [[NSString alloc] initWithFormat:eyepiece.text];
        [eyepiece setText:eyepieceString];
        NSUserDefaults *eyepieceDefault = [NSUserDefaults standardUserDefaults];
        [eyepieceDefault setObject:eyepieceString forKey:@"eyepieceKey"];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"eyepieceKey"];
    }
    
    if (objectiveLenses.text != nil) {
        
        objectiveLensString = [[NSString alloc] initWithFormat:objectiveLenses.text];
        [objectiveLenses setText:objectiveLensString];
        NSUserDefaults *objectiveDefault = [NSUserDefaults standardUserDefaults];
        [objectiveDefault setObject:objectiveLensString forKey:@"objectiveKey"];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"objectiveKey"];
    }
    
    if (focussingKnobs.text != nil) {
        
        focussingString = [[NSString alloc] initWithFormat:focussingKnobs.text];
        [focussingKnobs setText:focussingString];
        NSUserDefaults *focussingDefaults = [NSUserDefaults standardUserDefaults];
        [focussingDefaults setObject:focussingString forKey:@"focussingKey"];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"focussingKey"];
    }
    
    if (stage.text != nil) {
        stageString = [[NSString alloc] initWithFormat:stage.text];
        [stage setText:stageString];
        NSUserDefaults *stageDefault = [NSUserDefaults standardUserDefaults];
        [stageDefault setObject:stageString forKey:@"stageKey"];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"stageKey"];
    }
    
    if (mirror.text != nil) {
        mirrorString = [[NSString alloc] initWithFormat:mirror.text];
        [mirror setText:mirrorString];
        NSUserDefaults *mirrorDefault = [NSUserDefaults standardUserDefaults];
        [mirrorDefault setObject:mirrorString forKey:@"mirrorKey"];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mirrorKey"];
    }
    
    if (finalMicroscopeScore != nil) {
        finalScoreString = [[NSString alloc] initWithFormat:finalMicroscopeScore];
        [microscopeScoreLabel setText:finalScoreString];
        NSUserDefaults *finalScoreDefault = [NSUserDefaults standardUserDefaults];
        [finalScoreDefault setObject:finalScoreString forKey:@"finalScoreKey"];
    }
    else {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"finalScoreKey"];
    }
    
    
    if (x == 5) {

        OverallLevelThreeViewController *ovc = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall"];
        ovc.brainString = @"5";
        //   bvc 
        [self.navigationController pushViewController:ovc animated:YES];
    } 

    
}

-(void)preparationOfFields
{
    allTextfields = [[NSArray alloc] initWithObjects:eyepiece, objectiveLenses, focussingKnobs, stage, mirror, nil];
    allTicks = [[NSArray alloc] initWithObjects:eyepieceTick, objectiveTick, focussingTick, stageTick, mirrorTick, nil];
    

}

- (IBAction)checkAnswers:(UITextField *)textField
{
    [self preparationOfFields];
    [microscopeBrain getTheDictionary];
    
    NSString *theTextfieldTag = [NSString stringWithFormat:@"%i", textField.tag];
    
    if (x < 5) {
    UIImage *image = [UIImage imageNamed:@"Tick.png"];
               
        if ([textField.text isEqualToString:[[microscopeBrain.microscopeDictionary valueForKey:theTextfieldTag] valueForKey:@"Answer"]]) 
        {
            [[allTicks objectAtIndex:textField.tag] setImage:image];
            x++;
          textField.enabled = NO;
        }
        finalMicroscopeScore = [[NSString alloc] initWithFormat:@"%i", x];
        microscopeScoreLabel.text = finalMicroscopeScore;

        }

    if (x <= 4) {
        microscopeScoreLabel.textColor = [UIColor orangeColor];
    }
    if (x <= 2) 
    {
        microscopeScoreLabel.textColor = [UIColor redColor];
    }
    if (x == 5) {
        microscopeScoreLabel.textColor = [UIColor greenColor];
        NSString *temp = @". Click Save!";
        NSString *whenPassed = [finalMicroscopeScore stringByAppendingString:temp];
        microscopeScoreLabel.text = whenPassed;
    }
      
}

- (IBAction)buttonClear: (UITextField *) textfield: (UIImageView *) image {
   
    
    [microscopeScoreLabel setText:nil];   
     
    finalMicroscopeScore = nil;

    for (textfield in allTextfields) {
        textfield.enabled = YES;
        textfield.text = nil;
    }
    
    for (image in allTicks) {
        image.image = nil;
    }
    x = 0;
    microscopeBrain.theScore = 0;
    
}

- (void)loadView
{
    [super loadView];
    // If you create your views manually, you MUST override this method and use it to create your views.
    // If you use Interface Builder to create your views, then you must NOT override this method.
}

-(void)viewDidAppear:(BOOL)animated 
{

    //[self checkAnswers:eyepiece];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (microscopeBrain == nil) {
    microscopeBrain = [[MicroscopeModel alloc] init];
    }
    if(theBigBrain == nil) {
        
    theBigBrain = [[BigBrain alloc] init];
    }

    //x = 0;
    
    [eyepiece setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"eyepieceKey"]];
    [objectiveLenses setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"objectiveKey"]];
    [focussingKnobs setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"focussingKey"]];
    [stage setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"stageKey"]];
    [mirror setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"mirrorKey"]];
    [microscopeScoreLabel setText:[[NSUserDefaults standardUserDefaults] objectForKey:@"finalScoreKey"]];
    
    
    [self preparationOfFields];
    
    NSEnumerator *enumerator = [allTextfields objectEnumerator];
    id object;
    
    while ((object = [enumerator nextObject])) {
        // do something with object...
        [self checkAnswers:object];
    }
    /*
    [self checkAnswers:eyepiece];
    [self checkAnswers:objectiveLenses];
    [self checkAnswers:focussingKnobs];
    [self checkAnswers:stage];
    [self checkAnswers:mirror];
    */
    
}


- (void)viewDidUnload
{
    [self setEyepiece:nil];
    [self setObjectiveLenses:nil];
    [self setFocussingKnobs:nil];
    [self setStage:nil];
    [self setMirror:nil];
    [self setEyepieceTick:nil];
    [self setFocussingTick:nil];
    [self setObjectiveTick:nil];
    [self setStageTick:nil];
    [self setMirrorTick:nil];
    [self setMicroscopeScoreLabel:nil];
    
    microscopeBrain.theScore = 0;
    theBigBrain.theScore = 0;
        
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return NO;
}

@end
