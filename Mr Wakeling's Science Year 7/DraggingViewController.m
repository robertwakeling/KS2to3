//
//  DraggingViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 13/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DraggingViewController.h"

@interface DraggingViewController ()

@end

@implementation DraggingViewController


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
    return theDictionary;
}

/*
 -(NSArray *)theMovingImageViews
{
    return theButtons;
}
*/

-(UILabel*)getTheLabel
{
    return theScoreLabel;
}
 
-(NSArray*)getTheTicks
{
    return theTicks;
}

-(NSArray*)getTheButtons
{
    return theButtons;
}

-(void)checkTheColours
{
    float x = theScore;
    
    if (x / [theButtons count] <= 0.4) 
    {
        [self getTheLabel].textColor = [UIColor redColor];
    }
    if (x / [theButtons count] > 0.4) {
        
        [self getTheLabel].textColor = [UIColor orangeColor];
    }
    if (x == [theButtons count]) {
        [self getTheLabel].textColor = [UIColor greenColor];
    
    }
}

-(void)resetTheImages
{
    [self getTheDictionary];
  //  [self theMovingImageViews];
    [self getTheTicks];
    [self getTheButtons];
    
    thePositions = [NSUserDefaults standardUserDefaults];
    
    /*
    for (UIImageView *theImage in theImageViews) {
        NSString *temp = [[NSString alloc] initWithFormat:@"%i",theImage.tag];
        
        [thePositions removeObjectForKey:[[theDictionary objectForKey:temp] objectForKey:@"Key"]];
        
        [UIImageView animateWithDuration:0.3 animations:^{
            
            theImage.center = CGPointMake([[[theDictionary objectForKey:temp] objectForKey:@"StartingX"] floatValue], [[[theDictionary objectForKey:temp] objectForKey:@"StartingY"] floatValue]);
            
            
        }];
        
        [theImage setUserInteractionEnabled:YES];
    }
     */
    [self getTheLabel].text = nil;
    
    theScore = 0;
    
    for (UIButton *theImage in theButtons) {
        NSString *temp = [[NSString alloc] initWithFormat:@"%i",theImage.tag];
        
        [thePositions removeObjectForKey:[[theDictionary objectForKey:temp] objectForKey:@"Key"]];
        
        [UIButton animateWithDuration:0.3 animations:^{
            
            theImage.center = CGPointMake([[[theDictionary objectForKey:temp] objectForKey:@"StartingX"] floatValue], [[[theDictionary objectForKey:temp] objectForKey:@"StartingY"] floatValue]);
            
            
        }];
        
        [theImage setUserInteractionEnabled:YES];
    }

    for (UIImageView *theImages in theTicks) {
        theImages.image = nil;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self getTheDictionary];
    //[self theMovingImageViews];
    [self getTheButtons];
    [self getTheTicks];
    
    /*
    for (UIView *imageView in theImageViews) {
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] 
                                         initWithTarget:self action:@selector(handlePanGesture:)];
        [imageView addGestureRecognizer:panGR];
        
    }
    
    
    
    thePositions = [NSUserDefaults standardUserDefaults];
    
    for (UIImageView *anImage in theImageViews) {
        NSString *temp = [[NSString alloc] initWithFormat:@"%i", anImage.tag];
        
        if ([thePositions objectForKey:[[theDictionary objectForKey:temp] objectForKey:@"Key"]] != nil) {
            anImage.center = CGPointFromString([thePositions objectForKey:[[theDictionary objectForKey:temp] objectForKey:@"Key"]]);
            
            [anImage setUserInteractionEnabled:NO];
        }
        else {
            anImage.center = CGPointMake([[[theDictionary objectForKey:temp] objectForKey:@"StartingX"] floatValue], [[[theDictionary objectForKey:temp] objectForKey:@"StartingY"] floatValue]);
            [anImage setUserInteractionEnabled:YES];
        }
    }
     */
    
    
    for (UIButton *imageView in theButtons) {
        UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] 
                                         initWithTarget:self action:@selector(handlePanGesture:)];
        [imageView addGestureRecognizer:panGR];
        
    }

    theScore = 0;

    thePositions = [NSUserDefaults standardUserDefaults];
    
    for (UIButton *anImage in theButtons) {
        NSString *temp = [[NSString alloc] initWithFormat:@"%i", anImage.tag];
        
        if ([thePositions objectForKey:[[theDictionary objectForKey:temp] objectForKey:@"Key"]] != nil) {
            anImage.center = CGPointFromString([thePositions objectForKey:[[theDictionary objectForKey:temp] objectForKey:@"Key"]]);
            
            [anImage setUserInteractionEnabled:NO];
            
            UIImageView *theTemporaryOne = [theTicks objectAtIndex:anImage.tag];
            
            theTemporaryOne.center = CGPointMake([[[theDictionary objectForKey:temp] objectForKey:@"TickX"] floatValue], [[[theDictionary objectForKey:temp] objectForKey:@"TickY"] floatValue]);
            
            [theTemporaryOne setHidden:NO];
            
       //      NSLog(@"%f, %f", theTemporaryOne.center.x, theTemporaryOne.center.y);
            
            theScore++;
            if (theScore == theButtons.count) {
                [self getTheLabel].text = [[NSString alloc] initWithFormat:@"%i/%i. Click Save!", theScore, theButtons.count];
            }
            else {
                [self getTheLabel].text = [[NSString alloc] initWithFormat:@"%i/%i", theScore, theButtons.count];
            }
            
            [self getTheLabel].font = [UIFont fontWithName:@"Chalkduster" size:25];
            [self checkTheColours];
            
        }
        else {
            anImage.center = CGPointMake([[[theDictionary objectForKey:temp] objectForKey:@"StartingX"] floatValue], [[[theDictionary objectForKey:temp] objectForKey:@"StartingY"] floatValue]);
            [anImage setUserInteractionEnabled:YES];
            
            UIImageView *theTemporaryTwo = [theTicks objectAtIndex:anImage.tag];
            
            [theTemporaryTwo setHidden:YES];    
            
          //  [self getTheLabel].text = [[NSString alloc] initWithFormat:@"%i/%i", theScore, theButtons.count];
          //  [self getTheLabel].font = [UIFont fontWithName:@"Chalkduster" size:14];


        }
    }

}

- (void)handlePanGesture:(UIGestureRecognizer *)gestureRecognizer {
    /*
    UIPanGestureRecognizer *panGR = (UIPanGestureRecognizer *)gestureRecognizer;
    UIView *gestureView = [panGR view];
    CGPoint translation = [panGR translationInView:gestureView];
    gestureView.center = CGPointMake(gestureView.center.x + translation.x,
                                     gestureView.center.y + translation.y);
    [panGR setTranslation:CGPointZero inView:gestureView];
    */
    
    UIPanGestureRecognizer *panGR = (UIPanGestureRecognizer *)gestureRecognizer;
    UIView *gestureView = [panGR view];
    CGPoint translation = [panGR translationInView:gestureView];
    gestureView.center = CGPointMake(gestureView.center.x + translation.x,
                                     gestureView.center.y + translation.y);
    [panGR setTranslation:CGPointZero inView:gestureView];
    
    
    if (!theDictionary) 
    {
        [self getTheDictionary];
    }
    
    [self getTheTicks];
    
    NSString *temp = [[NSString alloc] initWithFormat:@"%i",gestureView.tag];
   
    UIImage *image = [UIImage imageNamed:@"Tick.png"];
    
    if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
    
    //    NSLog(@"%f,%f", gestureView.center.x, gestureView.center.y);
        
    if (((gestureView.center.x >= [[[theDictionary objectForKey:temp] objectForKey:@"MinFinishingX"] floatValue]) && (gestureView.center.x <= [[[theDictionary objectForKey:temp] objectForKey:@"MaxFinishingX"] floatValue]) && (gestureView.center.y >= [[[theDictionary objectForKey:temp] objectForKey:@"MinFinishingY"] floatValue]) && (gestureView.center.y <= [[[theDictionary objectForKey:temp] objectForKey:@"MaxFinishingY"] floatValue]))) 
    {        
        gestureView.center = CGPointMake([[[theDictionary objectForKey:temp] objectForKey:@"FinishingX"] floatValue], [[[theDictionary objectForKey:temp] objectForKey:@"FinishingY"] floatValue]);
        
        thePositions = [[NSUserDefaults standardUserDefaults] init];
        
        NSString *centre = NSStringFromCGPoint(gestureView.center);
        
        [thePositions setObject:centre forKey:[[theDictionary objectForKey:temp] objectForKey:@"Key"]];
        
        [thePositions synchronize];
        
        [gestureView setUserInteractionEnabled:NO];
        
        [[theTicks objectAtIndex:gestureView.tag] setImage:image];
        
        UIImageView *temp1 = [theTicks objectAtIndex:gestureView.tag];
        
        temp1.center = CGPointMake([[[theDictionary objectForKey:temp] objectForKey:@"TickX"] floatValue], [[[theDictionary objectForKey:temp] objectForKey:@"TickY"] floatValue]);
        
        [temp1 setHidden:NO];
        
        theScore++;
        
        if (theScore == theButtons.count) {
            theScoreLabel.text = [[NSString alloc] initWithFormat:@"%i/%i. Click Save!", theScore, theButtons.count];
            [self getTheLabel].font = [UIFont fontWithName:@"Chalkduster" size:25];
            
        }
        
        else
        {
            theScoreLabel.text = [[NSString alloc] initWithFormat:@"%i/%i", theScore, theButtons.count];
        }
        
        [self checkTheColours];

        [self getTheLabel].font = [UIFont fontWithName:@"Chalkduster" size:25];

        
    }
    else 
    {
        gestureView.center = CGPointMake([[[theDictionary objectForKey:temp] objectForKey:@"StartingX"] floatValue], [[[theDictionary objectForKey:temp] objectForKey:@"StartingY"] floatValue]);
    }
    }
}

-(IBAction)clickingTheSaveButton
{
    [self getTheButtons];
    
    if (theScore == theButtons.count) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:[[self getTheDictionary] objectForKey:@"Name"] object:self];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
