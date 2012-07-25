//
//  AcidsThreeTesterViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 03/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AcidsThreeTesterViewController.h"

@interface AcidsThreeTesterViewController ()

@end

@implementation AcidsThreeTesterViewController
@synthesize acidAlkaliPicker;
@synthesize tickView;
@synthesize imageViewer;
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"AcidsThreeTester" ofType:@"plist"];
    theAnswers = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    acidsAlkalis = [theAnswers allKeys];
    
    
    
    [self pickerView:acidAlkaliPicker didSelectRow:0 inComponent:0];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return acidsAlkalis.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [acidsAlkalis objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    theSelectedRow = row;
    
    NSString *theImage = [[NSString alloc] initWithFormat:@"%@", [[theAnswers objectForKey:[acidsAlkalis objectAtIndex:row]] objectForKey:@"Image"]];
    UIImage *thePictureImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", theImage]];
    
    [imageViewer setImage:thePictureImage];
}

-(IBAction)checkAnswers:(UIButton*)sender
{
    //NSLog(@"%i", theSelectedRow);
    
    NSString *temp = [NSString stringWithFormat:@"%@", sender.titleLabel.text];
   // NSLog(@"%@",[[theAnswers objectForKey:[acidsAlkalis objectAtIndex:theSelectedRow]] objectForKey:@"Answer"]);
        //NSLog(@"%@", temp);
    
    NSString *answer = [[theAnswers objectForKey:[acidsAlkalis objectAtIndex:theSelectedRow]] objectForKey:@"Answer"];
    
    if ([answer isEqualToString: temp]) {
        theScore++;
        
    }
  //  NSLog(@"%i HI", theScore);
    
    theScoreLabel.text = [NSString stringWithFormat:@"%i/7", theScore];
    
    float x = theScore;
    
    if (x / 7 <= 0.4) 
    {
        theScoreLabel.textColor = [UIColor redColor];
    }
    if (x / 7 > 0.4) {
        
        theScoreLabel.textColor = [UIColor orangeColor];
    }
    if (x == 7) {
        theScoreLabel.textColor = [UIColor greenColor];
            }

    
    if (theSelectedRow < 6) {
        
            [acidAlkaliPicker selectRow:theSelectedRow + 1 inComponent:0 animated:YES];

    [self pickerView:acidAlkaliPicker didSelectRow:theSelectedRow +1 inComponent:0];
        
    //[self.acidAlkaliPicker reloadAllComponents];
    
    }
    if (((theSelectedRow  == 6) && (theScore == 7) && ([answer isEqualToString:temp]))) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You correctly answered each one!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [theAlert show];
        
    }
    else if ((theSelectedRow  == 6) && ((theScore < 6) || (![answer isEqualToString:temp]))) {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Unlucky!" message:@"You need to try this one again" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [theAlert show];

    }
    
//    if ((theSelectedRow  == 6) && ((theScore != 7) || (![answer isEqualToString:temp]))) {
//        
//    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (theScore == 7) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Acids3" object:self];
    }
    else {
        theScore = 0;
        theScoreLabel.text = nil;
        [acidAlkaliPicker selectRow:0 inComponent:0 animated:YES];
        [self pickerView:acidAlkaliPicker didSelectRow:0 inComponent:0];
        [self.acidAlkaliPicker reloadAllComponents];
    }
}

- (void)viewDidUnload
{
    [self setAcidAlkaliPicker:nil];
    [self setTickView:nil];
    [self setImageViewer:nil];
    [self setTheScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
