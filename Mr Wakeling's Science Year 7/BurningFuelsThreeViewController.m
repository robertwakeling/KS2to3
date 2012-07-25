//
//  BurningFuelsThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 25/07/2012.
//
//

#import "BurningFuelsThreeViewController.h"

@interface BurningFuelsThreeViewController ()

@end

@implementation BurningFuelsThreeViewController
@synthesize carbonDioxide;
@synthesize globalWarming;
@synthesize sulfurDioxide;
@synthesize rain;
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
    int a, b, c, d;
    
    
    if ([carbonDioxide.text isEqualToString:@"carbon dioxide"]) {
        a = 1;
    }
    else
    {
        a = 0;
    }
    if ([globalWarming.text isEqualToString:@"global warming"]) {
        b = 1;
    }
    else
    {
        b = 0;
    }
    if ([sulfurDioxide.text isEqualToString:@"sulfur dioxide"]) {
        c = 1;
    }
    else
    {
        c = 0;
    }
    if ([rain.text isEqualToString:@"rain"]) {
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
    if (theScore == 3) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    
    if (theScore == 4) {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know the problems with burning fuels!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BurningFuels3" object:self];
}

- (void)viewDidUnload
{
    [self setScoreLabel:nil];
    [self setCarbonDioxide:nil];
    [self setGlobalWarming:nil];
    [self setSulfurDioxide:nil];
    [self setRain:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
