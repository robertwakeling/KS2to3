//
//  ChemicalEnergyThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 26/07/2012.
//
//

#import "ChemicalEnergyThreeViewController.h"

@interface ChemicalEnergyThreeViewController ()

@end

@implementation ChemicalEnergyThreeViewController
@synthesize energy;
@synthesize various;
@synthesize scoreLabel;

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

-(IBAction)checkAnswers
{
    int a, b;
    if ([energy.text isEqualToString:@"energy"]) {
        a = 1;
    }
    else {
        a = 0;
    }
    if ([various.text isEqualToString:@"movement"] || [various.text isEqualToString:@"growth"] || [various.text isEqualToString:@"repair"] || [various.text isEqualToString:@"digestion"]) {
        b = 1;
    }
    else {
        b = 0;
    }
    theScore = a + b;
    scoreLabel.text = [NSString stringWithFormat:@"%i/2", theScore];
    if (theScore < 1) {
        scoreLabel.textColor = [UIColor redColor];
    }
    if (theScore == 1) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (theScore == 2) {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know that food gives us energy!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChemicalEnergy3" object:self];
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

- (NSArray *) LowTextFieldsThatNeedTheViewToMove
{
    textfieldThatNeedsMoving = [[NSArray alloc] initWithObjects:various, nil];
    return textfieldThatNeedsMoving;
}

- (void) shiftViewUpForKeyboard: (NSNotification*)theNotification;
{
    
    
    NSEnumerator *enumerator = [[self LowTextFieldsThatNeedTheViewToMove] objectEnumerator];
    UITextField *object;
    
    while ((object = [enumerator nextObject])) {
        // do something with object...
        if (object.isEditing) {
            
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


- (void)viewDidUnload
{
    [self setEnergy:nil];
    [self setVarious:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
