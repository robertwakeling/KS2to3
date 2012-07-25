//
//  MagnificationViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 12/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MagnificationViewController : UIViewController <UIGestureRecognizerDelegate, UITextFieldDelegate>
{
    // To move the view up and down for text fields
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;

}

@property (weak, nonatomic) IBOutlet UIButton *ruler;
@property (weak, nonatomic) IBOutlet UITextField *textEntry;

@property (weak, nonatomic) IBOutlet UILabel *lengthInMM;
@property (weak, nonatomic) IBOutlet UILabel *actualLength;
@property (weak, nonatomic) IBOutlet UILabel *micrometer;
@property (weak, nonatomic) IBOutlet UILabel *actualMicrons;

-(IBAction)handleRotate:(UIRotationGestureRecognizer *)recogniser;

@end
