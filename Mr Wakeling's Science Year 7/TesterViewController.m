//
//  TesterViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 14/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TesterViewController.h"

@interface TesterViewController ()

@end

@implementation TesterViewController
@synthesize first;
@synthesize second;
@synthesize third;
@synthesize fourth;
@synthesize fifth;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSDictionary *)getTheDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DraggingTester" ofType:@"plist"];
    theDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return theDictionary;
}

-(UILabel *)getTheLabel
{
    // name this whatever the label is called in the nib
    
    return theScoreLabel;

}

-(NSArray *)theMovingImageViews
{
 //   theImageViews = [[NSArray alloc] initWithObjects:first, second, third, nil];
    theButtons = [[NSArray alloc] initWithObjects:fourth, fifth, nil];
    
    return theButtons;
}

-(NSArray *)getTheTicks
{
    theTicks = [[NSArray alloc] initWithObjects:first, second, third, nil];
    return theTicks;
}

-(NSArray *)getTheButtons
{
    theButtons = [[NSArray alloc] initWithObjects:fourth, fifth, nil];
    return theButtons;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setFirst:nil];
    [self setSecond:nil];
    [self setThird:nil];
    [self setFourth:nil];
    [self setFifth:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
