//
//  AdaptationThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 27/07/2012.
//
//

#import "AdaptationThreeViewController.h"

@interface AdaptationThreeViewController ()

@end

@implementation AdaptationThreeViewController
@synthesize light;
@synthesize temperature;
@synthesize spring;
@synthesize summer;
@synthesize autumn;
@synthesize winter;
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
    int a, b, c, d, e, f;
    
    if ([light.text isEqualToString:@"Light"]) {
        a = 1;
    }
    else
    {
        a = 0;
    }
    
    if ([temperature.text isEqualToString:@"Temperature"]) {
        b = 1;
    }
    else
    {
        b = 0;
    }
    
    if ([spring.text isEqualToString:@"Spring"]) {
        c = 1;
    }
    else
    {
        c = 0;
    }
    
    if ([summer.text isEqualToString:@"Summer"]) {
        d = 1;
    }
    else
    {
        d = 0;
    }
    
    if ([autumn.text isEqualToString:@"Autumn"]) {
        e = 1;
    }
    else
    {
        e = 0;
    }
    
    if ([winter.text isEqualToString:@"Winter"]) {
        f = 1;
    }
    else
    {
        f = 0;
    }
    theScore = a + b + c + d + e + f;
    scoreLabel.text = [NSString stringWithFormat:@"%i/6", theScore];
    
    if (theScore <= 3) {
        scoreLabel.textColor = [UIColor redColor];
    }
    if ((theScore >3) && (theScore < 6)) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (theScore == 6) {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know the differences between day and night and the seasons" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
[self.navigationController pushViewController:detail animated:YES];

[[NSNotificationCenter defaultCenter] postNotificationName:@"Adaptation3" object:self];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return  NO;
}

- (void)viewDidUnload
{
    [self setSpring:nil];
    [self setSummer:nil];
    [self setAutumn:nil];
    [self setWinter:nil];
    [self setScoreLabel:nil];
    [self setLight:nil];
    [self setTemperature:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
