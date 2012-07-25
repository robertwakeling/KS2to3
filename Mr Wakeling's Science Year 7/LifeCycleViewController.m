//
//  LifeCycleViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LifeCycleViewController.h"

@interface LifeCycleViewController ()

@end

@implementation LifeCycleViewController
@synthesize adolescence;
@synthesize adulthood;
@synthesize birth;
@synthesize reproduction;
@synthesize fertilisation;
@synthesize hidden;

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

-(IBAction)hideAndShow:(id)sender
{
    NSArray *theLabels = [[NSArray alloc] initWithObjects:adolescence, adulthood, birth, reproduction, fertilisation, nil];
    
    for (UILabel *label in theLabels) {
        if (label.isHidden == YES) {
            label.hidden = NO;
        }
        else {
            label.hidden = YES;
        }
    }
}

-(IBAction)transitionToViewController
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Baby3" object:self];
    
}

- (void)viewDidUnload
{
    [self setAdolescence:nil];
    [self setAdulthood:nil];
    [self setBirth:nil];
    [self setReproduction:nil];
    [self setFertilisation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
