//
//  MixturesThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 21/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MixturesThreeViewController.h"

@interface MixturesThreeViewController ()

@end

@implementation MixturesThreeViewController
@synthesize nitrogen;
@synthesize oxygen;
@synthesize carbonDioxide;
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

-(IBAction)checkAnswers:(id)sender
{
    theScore = 0;
    
    if ([nitrogen.text isEqualToString:@"Nitrogen"]) {
        theScore ++;
    }
        if ([oxygen.text isEqualToString:@"Oxygen"]) {
            theScore ++;
        }
            if ([carbonDioxide.text isEqualToString:@"Carbon dioxide"]) {
                theScore ++;
            }
        
    
scoreLabel.text = [NSString stringWithFormat:@"%i/3", theScore];

switch(theScore)
{
        case 0:
        scoreLabel.textColor = [UIColor redColor];
        break;
        case 1:
        scoreLabel.textColor = [UIColor redColor];
        break;
        case 2:
        scoreLabel.textColor = [UIColor orangeColor];
        break;
        case 3:
        scoreLabel.textColor = [UIColor greenColor];
        
        break;
        default:
        break;
        
}


}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (theScore == 3) {
        
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You know what mixtures are!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Mixtures3" object:self];
}

- (void)viewDidUnload
{
    [self setNitrogen:nil];
    [self setOxygen:nil];
    [self setCarbonDioxide:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
