//
//  HabitatsViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HabitatsViewController.h"

@interface HabitatsViewController ()

@end

@implementation HabitatsViewController
@synthesize desert;
@synthesize woodland;
@synthesize coastal;
@synthesize polar;
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
    theLabels = [[NSArray alloc] initWithObjects:desert, woodland, coastal, polar, nil];
    for (UILabel *label in theLabels) {
        [label.layer setCornerRadius:10];
    }
}

-(IBAction)hideAndShow:(id)sender
{
    
    
    for (UILabel *label in theLabels) {
        if (label.isHidden == YES) {
            label.hidden = NO;
        }
        else {
            label.hidden = YES;
        }
    }
}

-(IBAction)transitionToNewController:(id)sender
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    
    [self.navigationController pushViewController:detail animated:YES];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"Habitat3" object:self];
}

- (void)viewDidUnload
{
    [self setDesert:nil];
    [self setWoodland:nil];
    [self setCoastal:nil];
    [self setPolar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
