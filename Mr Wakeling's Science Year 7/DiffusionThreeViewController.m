//
//  DiffusionThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 21/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DiffusionThreeViewController.h"

@interface DiffusionThreeViewController ()

@end

@implementation DiffusionThreeViewController
@synthesize one;
@synthesize two;
@synthesize three;
@synthesize four;
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
    objects = [[NSArray alloc] initWithObjects:one, two, three, nil];
}

-(IBAction)showOrHide:(id)sender
{
    for (UILabel *thing in objects) {
        if (thing.hidden == YES) {
            thing.hidden = NO;
        }
        else {
            thing.hidden = YES;
        }
    }
    if (four.hidden == YES) {
        four.hidden = NO;
    }
    else {
        four.hidden = YES;
    }
}

- (void)viewDidUnload
{
    [self setOne:nil];
    [self setTwo:nil];
    [self setThree:nil];
    [self setFour:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction)transition:(UIButton *)sender {
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Diffusion3" object:self];
}
@end
