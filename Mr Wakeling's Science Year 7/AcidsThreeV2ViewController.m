//
//  AcidsThreeV2ViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 03/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AcidsThreeV2ViewController.h"

@interface AcidsThreeV2ViewController ()

@end

@implementation AcidsThreeV2ViewController
@synthesize lemon;
@synthesize vinegar;
@synthesize shampoo;
@synthesize bleach;
@synthesize cleaner;
@synthesize cola;
@synthesize hydroxide;
@synthesize theScoreLabel;

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
    NSArray *movingButtons = [[NSArray alloc] initWithObjects:lemon, vinegar, shampoo, bleach, cleaner, cola, hydroxide, nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AcidsThree" ofType:@"plist"];
    theAnswers = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    for (UIButton *button in movingButtons) {
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [button addGestureRecognizer:panGR];
               // temp = [NSString stringWithFormat:@"%i", button.tag];
        
     //   NSLog(@"%@", [theAnswers valueForKey:temp]);
        
        theScore = 0;
        theScoreLabel.text = @"0/7";

}
   
}

-(IBAction)handlePan:(UIGestureRecognizer *)gestureRecognizer
{ 
    //  NSLog(@"%@", temp);
    UIPanGestureRecognizer *panGR = (UIPanGestureRecognizer *)gestureRecognizer;
    UIView *gestureView = [panGR view];
    CGPoint translation = [panGR translationInView:gestureView];
    gestureView.center = CGPointMake(gestureView.center.x + translation.x,
                                     gestureView.center.y + translation.y);
    [panGR setTranslation:CGPointZero inView:gestureView];
    
    temp = [NSString stringWithFormat:@"%i", gestureView.tag];
    
 //   float centerX = gestureView.center.x;
    
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        gestureView.transform = CGAffineTransformMakeScale(2, 2);
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        
    
    if (([[theAnswers valueForKey:temp] floatValue] == 1) && (gestureView.center.x > 465) && (gestureView.center.y > 270)) {
        [gestureView setUserInteractionEnabled:NO];
        theScore++;
    }
    if (([[theAnswers valueForKey:temp] floatValue] != 1) && (gestureView.center.x < 290) && (gestureView.center.y > 270)) {
        [gestureView setUserInteractionEnabled:NO];
        theScore++;
    }
    theScoreLabel.text = [NSString stringWithFormat:@"%i/7", theScore];
    
}
}

-(IBAction)transitionToTester
{
    if (theScore == 7) {
        AcidsThreeTesterViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"AcidsThreeTester"];
        
        [self.navigationController pushViewController:detail animated:YES];
    }
}

- (void)viewDidUnload
{
    [self setLemon:nil];
    [self setVinegar:nil];
    [self setShampoo:nil];
    [self setBleach:nil];
    [self setCleaner:nil];
    [self setCola:nil];
    [self setHydroxide:nil];
    [self setTheScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
