//
//  MagAssessmentViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 13/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MagAssessmentViewController.h"

@interface MagAssessmentViewController ()

@end

@implementation MagAssessmentViewController
@synthesize MaximumLength;
@synthesize lengthMicrons;
@synthesize changingLabel;
@synthesize scoreLabel;
@synthesize cellPicker;
@synthesize ruler;
@synthesize image;
@synthesize magnification;

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Magnification" ofType:@"plist"];
    cellInfo = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    theKeysFromThePlist = [cellInfo allKeys];
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [ruler addGestureRecognizer:panGR];
    
    UIRotationGestureRecognizer *rotateGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotate:)];

    [ruler addGestureRecognizer:rotateGR];
    
    [self pickerView:cellPicker didSelectRow:0 inComponent:0];
    
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



//------------------

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


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return theKeysFromThePlist.count;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [theKeysFromThePlist objectAtIndex:row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    theSelectedRow = row;
   // NSLog(@"%i", row);
    
    NSString *theImage = [[NSString alloc] initWithFormat:@"%@", [[cellInfo objectForKey:[theKeysFromThePlist objectAtIndex:row]] objectForKey:@"Image"]];
    
    UIImage *thePictureImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", theImage]];
    
    [image setImage:thePictureImage];
     
    magnification.text = [[[cellInfo objectForKey:[theKeysFromThePlist objectAtIndex:row]] objectForKey:@"Magnification"] stringValue];
    
    changingLabel.text = [[cellInfo objectForKey:[theKeysFromThePlist objectAtIndex:row]] objectForKey:@"Label"];
    
    MaximumLength.text = nil;
    lengthMicrons.text = nil;
    
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.keyboardType = UIKeyboardTypeNumberPad;
    
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

/*
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *theLength = MaximumLength.text;
    NSString *lengthInMicrons = lengthMicrons.text;
    
    NSLog(@"%@", theLength);
    NSLog(@"%@", lengthInMicrons);
    
}
*/

-(IBAction)checkTheAnswers:(id)sender
{
   // NSLog(@"%@", [theKeysFromThePlist objectAtIndex:theSelectedRow]);
    
//    float lengthMM = [[MaximumLength text] floatValue];
    float lengthMicroMetres = [[lengthMicrons text] floatValue];
        
    if (([[[cellInfo objectForKey:[theKeysFromThePlist objectAtIndex:theSelectedRow]] objectForKey:@"LowerBound"] floatValue] <= lengthMicroMetres) && ([[[cellInfo objectForKey:[theKeysFromThePlist objectAtIndex:theSelectedRow]] objectForKey:@"UpperBound"] floatValue] >= lengthMicroMetres)) {
       
        
        
        switch (theSelectedRow) {
            case 0:
                if (!plantCell)
                {
                plantCell = YES;
                    theScore++;
                }
                break;
            case 1:
                if (!humanEggCell) 
                {
                humanEggCell = YES;
                    theScore++;
                }
                break;
            case 2:
                if (!HIV) 
                {
                HIV = YES;
                    theScore++;
                }
                break;
            default:
                break;
        }
        scoreLabel.text = [NSString stringWithFormat:@"%i/%i", theScore, theKeysFromThePlist.count];
    }
    
}

-(IBAction)handlePan:(UIGestureRecognizer *)gestureRecognizer
{
    UIPanGestureRecognizer *panGR = (UIPanGestureRecognizer *)gestureRecognizer;
    UIView *gestureView = [panGR view];
    CGPoint translation = [panGR translationInView:gestureView];
    gestureView.center = CGPointMake(gestureView.center.x + translation.x,
                                     gestureView.center.y + translation.y);
    [panGR setTranslation:CGPointZero inView:gestureView];
}

-(IBAction)handleRotate:(UIRotationGestureRecognizer *)recogniser
{
    recogniser.view.transform = CGAffineTransformRotate(recogniser.view.transform, recogniser.rotation);
    recogniser.rotation = 0;
}

-(IBAction)transitionToNewViewController
{
    if (theScore == 3) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Microscopes6" object:self];
    }
}

- (void)viewDidUnload
{
    [self setCellPicker:nil];
    [self setRuler:nil];
    [self setImage:nil];
    [self setMagnification:nil];
    [self setMaximumLength:nil];
    [self setLengthMicrons:nil];
    [self setChangingLabel:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
