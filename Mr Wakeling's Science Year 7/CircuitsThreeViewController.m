//
//  CircuitsThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 28/07/2012.
//
//

#import "CircuitsThreeViewController.h"

@interface CircuitsThreeViewController ()

@end

@implementation CircuitsThreeViewController
@synthesize cell;
@synthesize bulb;
@synthesize switcher;
@synthesize electrons;
@synthesize complete;
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

-(NSArray*) LowTextFieldsThatNeedTheViewToMove
{
    lowTextFields = [[NSArray alloc] initWithObjects:electrons, complete, nil];
    return lowTextFields;
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


-(IBAction)checkAnswers
{
    int cellInt, bulbInt, switcherInt, electronsInt, completeInt;
    
    if ([cell.text isEqualToString:@"Cell"]) {
        cellInt = 1;
    }
    else
    {
        cellInt = 0;
    }
    
    if ([bulb.text isEqualToString:@"Bulb"]) {
        bulbInt = 1;
    }
    else
    {
        bulbInt = 0;
    }
    
    if ([switcher.text isEqualToString:@"Switch"]) {
        switcherInt = 1;
    }
    else
    {
        switcherInt = 0;
    }
    
    if ([electrons.text isEqualToString:@"electrons"]) {
        electronsInt = 1;
    }
    else
    {
        electronsInt = 0;
    }
    
    if ([complete.text isEqualToString:@"complete"]) {
        completeInt = 1;
    }
    else
    {
        completeInt = 0;
    }
    
    theScore = cellInt + bulbInt + switcherInt + electronsInt + completeInt;
    scoreLabel.text = [NSString stringWithFormat:@"%i/5", theScore];
    
    if (theScore <= 2) {
        scoreLabel.textColor = [UIColor redColor];
    }
    if ((theScore >2) && (theScore < 5)) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (theScore == 5) {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know the basics about circuits!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Circuits3" object:self];
}

- (void)viewDidUnload
{
    [self setCell:nil];
    [self setBulb:nil];
    [self setSwitcher:nil];
    [self setElectrons:nil];
    [self setComplete:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
