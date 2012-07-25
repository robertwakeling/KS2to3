//
//  MagAssessmentViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 13/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface MagAssessmentViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UIGestureRecognizerDelegate, UITextFieldDelegate>
{
    NSDictionary *cellInfo;
    NSArray *theKeysFromThePlist;
    
    NSInteger theSelectedRow;
    
    // To move the view up and down for text fields
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;
    
    int theScore;
    
    BOOL HIV;
    BOOL plantCell;
    BOOL humanEggCell;
    
}

@property (weak, nonatomic) IBOutlet UIPickerView *cellPicker;
@property (weak, nonatomic) IBOutlet UIButton *ruler;

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *magnification;

-(IBAction)handlePan:(UIGestureRecognizer *)recogniser;
-(IBAction)handleRotate:(UIRotationGestureRecognizer *)recogniser;

@property (weak, nonatomic) IBOutlet UITextField *MaximumLength;
@property (weak, nonatomic) IBOutlet UITextField *lengthMicrons;

@property (weak, nonatomic) IBOutlet UILabel *changingLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

-(IBAction)checkTheAnswers:(id)sender;

@end
