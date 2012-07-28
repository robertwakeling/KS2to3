//
//  CircuitsThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 28/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface CircuitsThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int theScore;
    
    // To move the view up and down for text fields
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;
    
    NSArray *lowTextFields;

}

@property (weak, nonatomic) IBOutlet UITextField *cell;
@property (weak, nonatomic) IBOutlet UITextField *bulb;
@property (weak, nonatomic) IBOutlet UITextField *switcher;

@property (weak, nonatomic) IBOutlet UITextField *electrons;
@property (weak, nonatomic) IBOutlet UITextField *complete;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
