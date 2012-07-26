//
//  ChemicalEnergyThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 26/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface ChemicalEnergyThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int theScore;
    
    NSArray *textfieldThatNeedsMoving;
    
    // To move the view up and down for text fields
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;
}

@property (weak, nonatomic) IBOutlet UITextField *energy;
@property (weak, nonatomic) IBOutlet UITextField *various;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
