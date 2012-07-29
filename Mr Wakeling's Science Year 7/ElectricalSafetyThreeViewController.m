//
//  ElectricalSafetyThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 30/07/2012.
//
//

#import "ElectricalSafetyThreeViewController.h"

@interface ElectricalSafetyThreeViewController ()

@end

@implementation ElectricalSafetyThreeViewController
@synthesize scoreLabel;
@synthesize conduct;
@synthesize shock;

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
    int a, b;
    
    if ([conduct.text isEqualToString:@"conduct"]) {
        a = 1;
    }
    else
    {
        a = 0;
    }
    
    if ([shock.text isEqualToString:@"shock"]) {
        b = 1;
    }
    else
    {
        b = 0;
    }
    theScore = a + b;
    scoreLabel.text = [NSString stringWithFormat:@"%i/2", theScore];
    
    if (theScore == 1) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (theScore == 2) {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know one of the dangers of electricity!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
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
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ElectricalSafety3" object:self];
}

- (void)viewDidUnload
{
    [self setScoreLabel:nil];
    [self setConduct:nil];
    [self setShock:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
