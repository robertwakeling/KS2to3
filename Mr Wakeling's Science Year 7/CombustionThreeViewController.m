//
//  CombustionThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 11/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CombustionThreeViewController.h"

@interface CombustionThreeViewController ()

@end

@implementation CombustionThreeViewController
@synthesize answerLabel;

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

-(IBAction)revealAnswer:(id)sender
{
    if (answerLabel.hidden == YES) {
        answerLabel.hidden = NO;
    }
    else if (answerLabel.hidden == NO) {
        answerLabel.hidden = YES;
    }
}

-(IBAction)transitionToNewController
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Combustion3" object:self];
}

- (void)viewDidUnload
{
    [self setAnswerLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
