//
//  SpecialisedViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 19/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SpecialisedViewController.h"

@interface SpecialisedViewController ()

@end

@implementation SpecialisedViewController
@synthesize shape;
@synthesize size;
@synthesize presenceNucleus;
@synthesize question;
@synthesize correctAnswerEntry;
@synthesize hidden;

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

-(IBAction)unhideTheAnswers:(id)sender
{
    NSArray *theLabels = [[NSArray alloc] initWithObjects:shape, size, presenceNucleus, question, nil];
    
    for (UILabel *object in theLabels) {
        if (object.isHidden == YES) {
            object.hidden = NO;
        }
        else {
            object.hidden = YES;
        }        
}
if(correctAnswerEntry.isHidden == YES)
{
    correctAnswerEntry.hidden = NO;
}
else {
    correctAnswerEntry.hidden = YES;
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
    
    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    theScore = [textField.text intValue];
    
    if ([textField.text isEqualToString:@"3"]) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You are now level 3 for this unit!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [theAlert show];
        
    }
    else {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Check your answers again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [theAlert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (theScore == 3) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Specialised3" object:self];
    }
}

- (void)viewDidUnload
{
    [self setShape:nil];
    [self setSize:nil];
    [self setPresenceNucleus:nil];
    [self setQuestion:nil];
    [self setCorrectAnswerEntry:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
