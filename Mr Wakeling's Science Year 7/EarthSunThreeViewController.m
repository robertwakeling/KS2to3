//
//  EarthSunThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 31/07/2012.
//
//

#import "EarthSunThreeViewController.h"

@interface EarthSunThreeViewController ()

@end

@implementation EarthSunThreeViewController
@synthesize earth;
@synthesize sun;
@synthesize duration;
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
    
    if ([earth.text isEqualToString:@"Earth"]) {
        a = 1;
    }
    else
    {
        a = 0;
    }
    
    if ([sun.text isEqualToString:@"Sun"]) {
        b = 1;
    }
    else
    {
        b = 0;
    }
    
    if ([duration.text isEqualToString:@"365"]) {
        c = 1;
    }
    else
    {
        c = 0;
    }
    theScore = a + b + c;
    scoreLabel.text = [NSString stringWithFormat:@"%i/3", theScore];
    if (theScore == 1)
{
    scoreLabel.textColor = [UIColor redColor];
}
if (theScore == 2)
{
    scoreLabel.textColor = [UIColor orangeColor];
}
if (theScore == 3)
{
    scoreLabel.textColor = [UIColor greenColor];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know the Earth orbits the Sun!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"EarthSun3" object:self];
}
- (void)viewDidUnload
{
    [self setScoreLabel:nil];
    [self setEarth:nil];
    [self setSun:nil];
    [self setDuration:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
