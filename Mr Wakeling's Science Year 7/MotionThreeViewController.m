//
//  MotionThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 31/07/2012.
//
//

#import "MotionThreeViewController.h"

@interface MotionThreeViewController ()

@end

@implementation MotionThreeViewController
@synthesize distance;
@synthesize time;
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

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)checkAnswers
{
    int a, b;
    
    if ([distance.text isEqualToString:@"Distance"]) {
        a = 1;
    }
    else
    {
        a = 0;
    }
    
    if ([time.text isEqualToString:@"Time"]) {
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
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know how to calculate speed!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Motion3" object:self];
}
- (void)viewDidUnload
{
    [self setDistance:nil];
    [self setTime:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
