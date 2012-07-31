//
//  BeyondThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 31/07/2012.
//
//

#import "BeyondThreeViewController.h"

@interface BeyondThreeViewController ()

@end

@implementation BeyondThreeViewController
@synthesize scoreLabel;
@synthesize milkyWay;
@synthesize galaxy;
@synthesize universe;

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

-(IBAction)checkAnswers
{
    int a, b, c;
    
    if ([milkyWay.text isEqualToString:@"Milky Way"]) {
        a = 1;
    }
    else
    {
        a = 0;
    }
    
    if ([galaxy.text isEqualToString:@"300"]) {
        b = 1;
    }
    else
    {
        b = 0;
    }
    
    if ([universe.text isEqualToString:@"100"]) {
        c = 1;
    }
    else
    {
        c = 0;
    }
theScore = a + b + c;
scoreLabel.text = [NSString stringWithFormat:@"%i/3", theScore];

if (theScore == 1) {
    scoreLabel.textColor = [UIColor redColor];
}
if (theScore == 2) {
    scoreLabel.textColor = [UIColor orangeColor];
}
if (theScore == 3) {
    scoreLabel.textColor = [UIColor greenColor];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know about the bigger picture!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Beyond3" object:self];
}
- (void)viewDidUnload
{
    [self setScoreLabel:nil];
    [self setMilkyWay:nil];
    [self setGalaxy:nil];
    [self setUniverse:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
