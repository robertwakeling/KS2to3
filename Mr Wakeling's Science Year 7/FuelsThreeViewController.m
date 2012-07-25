//
//  FuelsThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 15/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FuelsThreeViewController.h"

@interface FuelsThreeViewController ()

@end

@implementation FuelsThreeViewController
@synthesize energy;
@synthesize co2;
@synthesize energyTick;
@synthesize co2Tick;

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
    textfields = [[NSDictionary alloc] initWithObjectsAndKeys:energy, @"0", co2, @"1", nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
    
}

-(IBAction)checkAnswers:(UITextField*)sender
{
    if ([energy.text isEqualToString:@"energy"]) {
        energyTick.hidden = NO;
        
    }
    if ([co2.text isEqualToString:@"carbon dioxide"]) {
        co2Tick.hidden = NO;
    
    }
    if (([energy.text isEqualToString:@"energy"]) && ([co2.text isEqualToString:@"carbon dioxide"])) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You now know the basics about fuels!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Fuels3" object:self];

}

- (void)viewDidUnload
{
    [self setEnergy:nil];
    [self setCo2:nil];
    [self setEnergyTick:nil];
    [self setCo2Tick:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
