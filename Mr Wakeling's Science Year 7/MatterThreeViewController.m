//
//  MatterThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 15/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MatterThreeViewController.h"

@interface MatterThreeViewController ()

@end

@implementation MatterThreeViewController
@synthesize label;
@synthesize images;
@synthesize scoreLabel;
@synthesize Solid;
@synthesize Liquid;
@synthesize Gas;

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Matter3" ofType:@"plist"];
    objectDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    objects = [objectDictionary allKeys];
    
    arrayPosition = 0;
    NSString *temp = [NSString stringWithFormat:@"%i", arrayPosition];
    
    label.text = [[objectDictionary objectForKey:temp] valueForKey:@"Text"];
    theScore = 0;
    scoreLabel.text = [NSString stringWithFormat:@"%i/%i", theScore, objects.count];
    images.image = [UIImage imageNamed:[[objectDictionary objectForKey:temp] valueForKey:@"Image"]];
}

-(IBAction)checkAnswers:(UIButton*)sender
{
    NSString *temp = [NSString stringWithFormat:@"%i", arrayPosition];
    
    if ([sender.titleLabel.text isEqualToString:[[objectDictionary objectForKey:temp] valueForKey:@"Answer"]]) {
        theScore++;
        arrayPosition++;
        NSString *secondTemp = [NSString stringWithFormat:@"%i", arrayPosition];
        
        scoreLabel.text = [NSString stringWithFormat:@"%i/%i", theScore, objects.count];
        label.text = [[objectDictionary objectForKey:secondTemp] valueForKey:@"Text"];
        images.image = [UIImage imageNamed:[[objectDictionary objectForKey:secondTemp] valueForKey:@"Image"]];
        
        if (theScore == objects.count) {
            UIAlertView *correctAlert = [[UIAlertView alloc] initWithTitle:@"Congratulations" message:@"You managed to answer each one correctly!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [correctAlert show];
            
        }
    }
    else {
        
        UIAlertView *wrongAlert = [[UIAlertView alloc] initWithTitle:@"Unlucky" message:@"That answer was incorrect" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [wrongAlert show];
        
        arrayPosition = 0;
        NSString *temp = [NSString stringWithFormat:@"%i", arrayPosition];
        
        label.text = [[objectDictionary objectForKey:temp] valueForKey:@"Text"];
        theScore = 0;
        scoreLabel.text = [NSString stringWithFormat:@"%i/%i", theScore, objects.count];
        images.image = [UIImage imageNamed:[[objectDictionary objectForKey:temp] valueForKey:@"Image"]];
    }
    
}

-(IBAction)labelColour:(id)sender
{
    float x = theScore;
    
    if (x / [objects count] <= 0.4) 
    {
        scoreLabel.textColor = [UIColor redColor];
    }
    if (x / [objects count] > 0.4) {
        
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (x == [objects count]) {
        scoreLabel.textColor = [UIColor greenColor];
        
    }

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (theScore == objects.count) {
        
    
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Matter3" object:self];
}
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setImages:nil];
    [self setScoreLabel:nil];
    [self setSolid:nil];
    [self setLiquid:nil];
    [self setGas:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
