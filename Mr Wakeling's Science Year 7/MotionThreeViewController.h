//
//  MotionThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 31/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"
@interface MotionThreeViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    int theScore;
}

@property (weak, nonatomic) IBOutlet UITextField *distance;
@property (weak, nonatomic) IBOutlet UITextField *time;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end
