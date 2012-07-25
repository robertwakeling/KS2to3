//
//  CellFiveAssessmentViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CellFiveAssessmentViewController.h"

@interface CellFiveAssessmentViewController ()

@end

@implementation CellFiveAssessmentViewController
@synthesize nucleus;
@synthesize cellMembrane;
@synthesize cytoplasm;
@synthesize cellWall;
@synthesize chloroplast;
@synthesize vacuole;
@synthesize hidden;
@synthesize scoreField;

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

-(void)shiftViewUpForKeyboard: (NSNotification *)theNotification
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


-(void)hideShowLabel:(UIButton *)sender: (UILabel *)theLabel
{
    int x = sender.tag;
    
    NSArray *theLabels = [[NSArray alloc] initWithObjects:nucleus, cellMembrane, cytoplasm, cellWall, chloroplast, vacuole, nil];
    
    for (UILabel *theLabel in theLabels) {
        if (theLabel.tag == x) {
            if (theLabel.hidden == YES) {
                theLabel.hidden = NO;
            }
            else {
                theLabel.hidden = YES;
            }
        }
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
 //   textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;

    return NO;
}

-(void)checkScores
{
    theScore = [scoreField.text intValue];
    
    if (theScore == 6) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Congratulations" message:@"You have learnt all of the descriptions!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [theAlert show];
        
}
    if (theScore == 4 || theScore == 5) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"That was close!" message:@"A touch more learning and you'll get it!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [theAlert show];
    }
    if (theScore < 4) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Try to dedicate some more time to learning these" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [theAlert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (theScore == 6) {
        
    
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Cells5" object:self];
}
}

- (void)viewDidUnload
{
    [self setNucleus:nil];
    [self setCellMembrane:nil];
    [self setCytoplasm:nil];
    [self setCellWall:nil];
    [self setChloroplast:nil];
    [self setVacuole:nil];
    [self setScoreField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
