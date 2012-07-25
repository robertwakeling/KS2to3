//
//  MagnificationViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 12/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MagnificationViewController.h"

@interface MagnificationViewController ()

@end

@implementation MagnificationViewController
@synthesize ruler;
@synthesize textEntry;
@synthesize lengthInMM;
@synthesize actualLength;
@synthesize micrometer;
@synthesize actualMicrons;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(shiftViewUpForKeyboard:)
                                                 name: UIKeyboardWillShowNotification
                                               object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self
                                             selector: @selector(shiftViewDownAfterKeyboard)
                                                 name: UIKeyboardWillHideNotification
                                               object: nil];
    
    
}

- (void) viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIKeyboardWillShowNotification
                                                  object: nil];
    [[NSNotificationCenter defaultCenter] removeObserver: self
                                                    name: UIKeyboardWillHideNotification
                                                  object: nil];
    
    
}

- (void) shiftViewUpForKeyboard: (NSNotification*)theNotification;
{      
    
    
            CGRect keyboardFrame;
            NSDictionary* userInfo = theNotification.userInfo;
            keyboardSlideDuration = [[userInfo objectForKey: UIKeyboardAnimationDurationUserInfoKey] floatValue];
            keyboardFrame = [[userInfo objectForKey: UIKeyboardFrameBeginUserInfoKey] CGRectValue];
            
            UIInterfaceOrientation theStatusBarOrientation = [[UIApplication sharedApplication] statusBarOrientation];
            
            if UIInterfaceOrientationIsLandscape(theStatusBarOrientation)
                keyboardShiftAmount = keyboardFrame.size.width;
            else 
                keyboardShiftAmount = keyboardFrame.size.height;
            
            [UIView beginAnimations: @"ShiftUp" context: nil];
            [UIView setAnimationDuration: keyboardSlideDuration];
            self.view.center = CGPointMake( self.view.center.x, self.view.center.y - keyboardShiftAmount);
            [UIView commitAnimations];
            viewShiftedForKeyboard = TRUE;
            
        
    
}

- (void) shiftViewDownAfterKeyboard;
{
    if (viewShiftedForKeyboard)
    {
        [UIView beginAnimations: @"ShiftUp" context: nil];
        [UIView setAnimationDuration: keyboardSlideDuration];
        self.view.center = CGPointMake( self.view.center.x, self.view.center.y + keyboardShiftAmount);
        [UIView commitAnimations];
        viewShiftedForKeyboard = FALSE;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [ruler addGestureRecognizer:panGR];
 
}

-(void)handleRotate:(UIRotationGestureRecognizer *)recogniser
{
    recogniser.view.transform = CGAffineTransformRotate(recogniser.view.transform, recogniser.rotation);
    recogniser.rotation = 0;
}

-(void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecogniser
{
    UIPanGestureRecognizer *panGR = (UIPanGestureRecognizer *)gestureRecogniser;
    UIView *gestureView = [panGR view];
    CGPoint translation = [panGR translationInView:gestureView];
    gestureView.center = CGPointMake(gestureView.center.x + translation.x,
                                     gestureView.center.y + translation.y);
    [panGR setTranslation:CGPointZero inView:gestureView];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *length = [[NSString alloc] initWithFormat:@"%@", textField.text];
    
    float yay = [length floatValue];
    
    /*
    NSString *proper = [[NSString alloc] initWithFormat:@"%.3f", yay];
    
    lengthInMM.text = proper;
    
    float lengthFloat = yay/900;
    
    NSLog(@"%f", lengthFloat);
    
    NSString *another = [[NSString alloc] initWithFormat:@"%f", lengthFloat];
    
    actualLength.text = another;
    
    NSLog(@"%@", another);
    
    float micrometerLength = lengthFloat * 1000;
    
    NSString *lastOne = [[NSString alloc] initWithFormat:@"%.1f", micrometerLength];
    
    micrometer.text = lastOne;
    
   // NSString *lastTwo = [[NSString alloc] initWithFormat:@"%
    
    float finalFloat = micrometerLength * 1000;
    
    actualLength.text = [[NSString alloc] initWithFormat:@"%.1f", finalFloat];
    */
     
    float metres = yay / 100;
    float actualInMetres = yay / 90000;
    float actualInMM = yay / 90;
    float actualInMicrons = yay / 0.09;
    
    lengthInMM.text = [NSString stringWithFormat:@"%f", metres];
    actualLength.text = [NSString stringWithFormat:@"%f", actualInMetres];
    micrometer.text = [NSString stringWithFormat:@"%.4f", actualInMM];
    actualMicrons.text = [NSString stringWithFormat:@"%.1f", actualInMicrons];
    
    
}

- (void)viewDidUnload
{
    [self setRuler:nil];
    [self setTextEntry:nil];
    [self setLengthInMM:nil];
    [self setActualLength:nil];
    [self setMicrometer:nil];
    [self setActualMicrons:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
