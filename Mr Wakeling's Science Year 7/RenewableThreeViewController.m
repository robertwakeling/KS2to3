//
//  RenewableThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 26/07/2012.
//
//

#import "RenewableThreeViewController.h"

@interface RenewableThreeViewController ()

@end

@implementation RenewableThreeViewController
@synthesize solar;
@synthesize wind;
@synthesize tidal;
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
    int a, b, c;
    
    if ([solar.text isEqualToString:@"solar"]) {
        a = 1;
    }
    else {
        a = 0;
    }
    
    if ([wind.text isEqualToString:@"wind"]) {
        b = 1;
    }
    else {
        b = 0;
    }
    if ([tidal.text isEqualToString:@"tidal"]) {
        c = 1;
    }
    else {
        c = 0;
    }
    theScore = a + b + c;
    scoreLabel.text = [NSString stringWithFormat:@"%i/3", theScore];
    
    if (theScore <= 1) {
        scoreLabel.textColor = [UIColor redColor];
    }
    if (theScore == 2) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (theScore == 3) {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know some examples of renewable energy!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
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
    textfieldThatNeedsMoving = [[NSArray alloc] initWithObjects:tidal, nil];
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




-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Renewable3" object:self];
}

- (void)viewDidUnload
{
    [self setSolar:nil];
    [self setWind:nil];
    [self setTidal:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
