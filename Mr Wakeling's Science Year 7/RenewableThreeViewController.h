//
//  RenewableThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 26/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface RenewableThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int theScore;
    
    // To move the view up and down for text fields
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;
    NSArray *textfieldThatNeedsMoving;
}

@property (weak, nonatomic) IBOutlet UITextField *solar;
@property (weak, nonatomic) IBOutlet UITextField *wind;
@property (weak, nonatomic) IBOutlet UITextField *tidal;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
