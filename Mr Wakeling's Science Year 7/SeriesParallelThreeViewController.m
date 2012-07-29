//
//  SeriesParallelThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 29/07/2012.
//
//

#import "SeriesParallelThreeViewController.h"

@interface SeriesParallelThreeViewController ()

@end

@implementation SeriesParallelThreeViewController
@synthesize imageView;
@synthesize series;
@synthesize parallel;
@synthesize scoreLabel;

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"SeriesParallel" ofType:@"plist"];
    model = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    keys = [model allKeys];
    
    temp = [[NSString alloc] init];
    
    i = 0;
    
    [self changeTheImageView];
    
//    temp = [[model objectForKey:currenti] valueForKey:@"Image"];
//    imageView.image = [UIImage imageNamed:temp];
}

-(void)changeTheImageView
{
    
    currenti = [NSString stringWithFormat:@"%i", i];
        
    temp = [[model objectForKey:currenti] valueForKey:@"Image"];
    imageView.image = [UIImage imageNamed:temp];
    
}

-(IBAction)checkAnswers:(UIButton*)sender
{
    if (![sender.titleLabel.text isEqualToString:[[model objectForKey:currenti] valueForKey:@"Answer"]]) {
        
        
        UIAlertView *incorrect = [[UIAlertView alloc] initWithTitle:@"Unlucky!" message:@"Check the definitions again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [incorrect show];
   //     [self changeTheImageView];
        return;
    }
    
    if ([sender.titleLabel.text isEqualToString:[[model objectForKey:currenti] valueForKey:@"Answer"]]) {
        
        i++;
        
        [self changeTheImageView];
        
        theScore++;
       // NSLog(@"%i", theScore);
        
    }
    
    scoreLabel.text = [NSString stringWithFormat:@"%i/5", theScore];
    
    if (theScore <= 2) {
        scoreLabel.textColor = [UIColor redColor];
    }
    if ((theScore >2) && (theScore < 5)) {
        scoreLabel.textColor = [UIColor orangeColor];
    }
    if (theScore == 5) {
        scoreLabel.textColor = [UIColor greenColor];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You can identify circuits!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (theScore == 5) {
        
    
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    [self.navigationController pushViewController:detail animated:YES];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SeriesParallel3" object:self];
}
    else
    {
        i = 0;
        theScore = 0;
        
        [self changeTheImageView];
        scoreLabel.text = nil;
    }
}

- (void)viewDidUnload
{
    [self setImageView:nil];
    [self setSeries:nil];
    [self setParallel:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
