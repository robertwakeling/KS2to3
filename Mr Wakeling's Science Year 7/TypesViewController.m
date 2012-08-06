//
//  TypesViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 06/08/2012.
//
//

#import "TypesViewController.h"

@interface TypesViewController ()

@end

@implementation TypesViewController
@synthesize egg;
@synthesize sperm;
@synthesize fertilisation;


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
    if ([egg.text isEqualToString:@"egg"]) {
        a = 1;
    }
    else
    {
        a = 0;
    }
    
    if ([sperm.text isEqualToString:@"sperm"]) {
        b = 1;
    }
    else
    {
        b = 0;
    }
    
    if ([fertilisation.text isEqualToString:@"fertilisation"]) {
        c = 1;
    }
    else
    {
        c = 0;
    }
theScore = a + b + c;

}

- (void)viewDidUnload
{

    [self setEgg:nil];
    [self setSperm:nil];
    [self setFertilisation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
