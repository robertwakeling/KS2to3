//
//  NonRenewableThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 24/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NonRenewableThreeViewController.h"

@interface NonRenewableThreeViewController ()

@end

@implementation NonRenewableThreeViewController
@synthesize coal;
@synthesize oil;
@synthesize gas;

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
    if ([coal.text isEqualToString:@"Coal"]) {
        coalInt = 1;
    }
    else {
        coalInt = 0;
    }
    if ([oil.text isEqualToString:@"Oil"]) {
        oilInt = 1;
    }
    else {
        oilInt = 0;
    }
    if ([gas.text isEqualToString:@"Gas"]) {
        gasInt = 1;
    }
    else {
        gasInt = 0;
    }
    
    if (coalInt + oilInt + gasInt == 3) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You now know the three main sources of renewable energy!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NonRenewable3" object:self];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void)viewDidUnload
{
    [self setCoal:nil];
    [self setOil:nil];
    [self setGas:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
