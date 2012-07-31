//
//  MoonThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 31/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface MoonThreeViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    int theScore;
    
    // To move the view up and down for text fields
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;

    // An array to hold the text fields near the bottom of the screen
    NSArray *theTextFieldsThatNeedMoving;

}

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UITextField *moon;
@property (weak, nonatomic) IBOutlet UITextField *earth;
@property (weak, nonatomic) IBOutlet UITextField *duration;

@end
