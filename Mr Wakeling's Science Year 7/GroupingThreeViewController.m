//
//  GroupingThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 27/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GroupingThreeViewController.h"

@interface GroupingThreeViewController ()

@end

@implementation GroupingThreeViewController
@synthesize vert;
@synthesize invert;

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
    
    [vert.layer setCornerRadius:10];
    [invert.layer setCornerRadius:10];
}

-(IBAction)transitionToNewController
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Grouping3" object:self];
}

- (void)viewDidUnload
{
    [self setVert:nil];
    [self setInvert:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
