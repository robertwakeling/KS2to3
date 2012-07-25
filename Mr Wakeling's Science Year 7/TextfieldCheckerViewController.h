//
//  TextfieldCheckerViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextfieldCheckerViewController : UIViewController <UITextFieldDelegate>
{
    // To move the view up and down for text fields
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;
    
    // An array to hold the text fields near the bottom of the screen
    NSArray *theTextFieldsThatNeedMoving;
    
    // An array for all text fields and tick images on screen
    NSArray *allTextFields;
    NSArray *allTickImages;
    
    // To save user entries in the text fields
    NSUserDefaults *textFieldDefault;
    NSArray *allOfTheTextStrings;
    
    // Strings to hold all of the user texts (for user defaults)
//    NSString *mercuryString;
//   NSString *venusString;
//    NSString *earthString;
//    NSString *marsString;
//    NSString *jupiterString;
//    NSString *saturnString;
//    NSString *uranusString;
//    NSString *neptuneString;
    
    
    // An array to hold the user default keys for retrieving the user text input
    // This needs the array filling with @"uranusKey" for example in preparation method
    NSArray *theUserDefaultKeys;
    
    // The Model Class and The Model Dictionary
    NSDictionary *theModelDictionary;
    
    // A string to go in to the score label
    NSString *finalScore;
    UILabel *scoreLabel;
    int theScore;
    
    // The model class must be instantiated in the ViewDidLoad
    
}


@end
