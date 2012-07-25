//
//  NeutralisationThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 06/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NeutralisationThreeViewController.h"

@interface NeutralisationThreeViewController ()

@end

@implementation NeutralisationThreeViewController
@synthesize neutral;

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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return NO;
}

-(IBAction)answerChecker:(UITextField *)textField
{
    if ([textField.text isEqualToString:@"neutralise"]) {
        
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Congratulations" message:@"You have learnt that acids and alkalis neutralise each other!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [theAlert show];
    
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Neutralisation3" object:self];
}

- (void)viewDidUnload
{
    [self setNeutral:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
