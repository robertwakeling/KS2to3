//
//  TextfieldCheckerViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TextfieldCheckerViewController.h"

@interface TextfieldCheckerViewController ()

@end

@implementation TextfieldCheckerViewController

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

- (NSArray *) LowTextFieldsThatNeedTheViewToMove
{
    return nil;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    float redColour = arc4random() % 255/255.0f;
    float greenColour = arc4random() % 255/255.0f;
    float blueColour = arc4random() % 255/255.0f;
    
    textField.textColor = [UIColor colorWithRed:redColour green:greenColour blue:blueColour alpha:1];
}


- (void) shiftViewUpForKeyboard: (NSNotification*)theNotification;
{      

    
    NSEnumerator *enumerator = [[self LowTextFieldsThatNeedTheViewToMove] objectEnumerator];
    UITextField *object;
    
    while ((object = [enumerator nextObject])) {
        // do something with object...
        if (object.isEditing) {
            
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
    }
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField 
{
    
    [textField resignFirstResponder];
    
    return NO;
}


-(IBAction)secondSaveUserEntries:(UITextField *)theTextField

{
    //  NSString *theTextFieldTag = [[NSString alloc] initWithFormat:@"%i", theTextField.tag];
    
    for (theTextField in allTextFields) {
        
        
        if (theTextField.text != nil) {
            NSString *theTemporary = [[NSString alloc] initWithFormat:@"%@", theTextField.text];
            textFieldDefault = [NSUserDefaults standardUserDefaults];
            NSString *theSecondTemp = [theUserDefaultKeys objectAtIndex:theTextField.tag];
            [textFieldDefault setObject:theTemporary forKey:theSecondTemp];
        }
        else {
            NSString *theSecondTemp = [theUserDefaultKeys objectAtIndex:theTextField.tag];
            
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:theSecondTemp];
        }
    }
}

- (NSArray *) preparationOfTextFields_TickImages_TextStringsAndUserDefaultKeys
{
    
    return nil;
}



- (IBAction)checkAnswers:(UITextField *)textField
//:(Class)theModel
//:(NSArray *)allOfTheTextFieldsArray
//:(NSArray *)allTheTickImages
//:(Class)theModel
//:(NSDictionary *)theModelDictionary


{
    [self preparationOfTextFields_TickImages_TextStringsAndUserDefaultKeys];
  //  [theModelClass getTheDictionary];
    
    [self justReturnTheLabelObject];
    
    NSString *theTextfieldTag = [NSString stringWithFormat:@"%i", textField.tag];
    
    
    if (theScore < [allTextFields count]) {
        UIImage *image = [UIImage imageNamed:@"Tick.png"];
                
        if ([textField.text isEqualToString:[[theModelDictionary valueForKey:theTextfieldTag] valueForKey:@"Answer"]]) 
        {
            [[allTickImages objectAtIndex:textField.tag] setImage:image];
            theScore++;
            textField.enabled = NO;
        }
        finalScore = [[NSString alloc] initWithFormat:@"%i/%i", theScore, [allTextFields count]];
        [self justReturnTheLabelObject].text = finalScore;
        
    }
    float x = theScore;
    
    if (x / [allTextFields count] <= 0.4) 
    {
        [self justReturnTheLabelObject].textColor = [UIColor redColor];
    }
    if (x / [allTextFields count] > 0.4) {

        [self justReturnTheLabelObject].textColor = [UIColor orangeColor];
    }
    if (x == [allTextFields count]) {
        [self justReturnTheLabelObject].textColor = [UIColor greenColor];
        NSString *temps = @". Click Save!";
        NSString *whenPassed = [finalScore stringByAppendingString:temps];
        [self justReturnTheLabelObject].text = whenPassed;
    }
    
}

- (UILabel *)justReturnTheLabelObject
{
    
    return nil;
}

- (IBAction)buttonClear: (UITextField *) theTextfield: (UIImageView *) TickImageView
//  : (UILabel *)theScoreLabel
// : (NSArray *)allOfTheTextFields
//  : (NSArray *)allOfTheTickImages 
{
    [self preparationOfTextFields_TickImages_TextStringsAndUserDefaultKeys];
    
    // goes in to an IBAction method
    
    
    [[self justReturnTheLabelObject] setText:nil];   
    
    // finalMicroscopeScore = nil;
    
    for (theTextfield in allTextFields) {
        theTextfield.enabled = YES;
        theTextfield.text = nil;
    }
    
    for (TickImageView in allTickImages) {
        TickImageView.image = nil;
    }
    theScore = 0;
    
    // microscopeBrain.theScore = 0;
    
}

-(void)creatingTheClass: (Class) theModelClass
{
    // alloc the class here and call in viewDidLoad??
    
}

-(void)settingTheTextfields
{
    // userDefaults then call in viewDidLoad
    
    for (id object in allTextFields) {
        int z = [allTextFields indexOfObject:object];
        
        [object setText:[[NSUserDefaults standardUserDefaults] objectForKey:[theUserDefaultKeys objectAtIndex:z]]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
   // theModelClass = [[Model alloc] init];
    
    [self preparationOfTextFields_TickImages_TextStringsAndUserDefaultKeys];
    
    [self settingTheTextfields];
        
    NSEnumerator *enumerator = [allTextFields objectEnumerator];
    UITextField * object;
//    (UITextField *) object;
    while (object = [enumerator nextObject]) {
        // do something with object...
        object.font = [UIFont fontWithName:@"Chalkduster" size:14];
        [self checkAnswers:object];
        
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
