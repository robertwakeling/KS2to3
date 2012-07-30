//
//  ForcesThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 30/07/2012.
//
//

#import "ForcesThreeViewController.h"

@interface ForcesThreeViewController ()

@end

@implementation ForcesThreeViewController
@synthesize scoreLabel;
@synthesize weight;
@synthesize airResistance;
@synthesize friction;
@synthesize thrust;

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
    int a, b, c, d;
    
    if ([weight.text isEqualToString:@"weight"]) {
        a = 1;
    }
    else
    {
        a = 0;
    }
    
    if ([airResistance.text isEqualToString:@"air resistance"]) {
        b = 1;
    }
    else
    {
        b = 0;
    }
    
    if ([friction.text isEqualToString:@"friction"]) {
        c = 1;
    }
    else
    {
        c = 0;
    }
    
    if ([thrust.text isEqualToString:@"thrust"]) {
        d = 1;
    }
    else
    {
        d = 0;
    }
    theScore = a + b + c + d;
    scoreLabel.text = [NSString stringWithFormat:@"%i/4", theScore];
    
    if (theScore <= 2) {
        scoreLabel.textColor = [UIColor redColor];
    }
    if ((theScore >2) && (theScore < 4)) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (theScore == 4) {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know some basic types of forces!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Forces3" object:self];
}

- (void)viewDidUnload
{
    [self setScoreLabel:nil];
    [self setWeight:nil];
    [self setAirResistance:nil];
    [self setFriction:nil];
    [self setThrust:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
