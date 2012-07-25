//
//  BurningFuelsThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 25/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface BurningFuelsThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int theScore;
}

@property (weak, nonatomic) IBOutlet UITextField *carbonDioxide;
@property (weak, nonatomic) IBOutlet UITextField *globalWarming;
@property (weak, nonatomic) IBOutlet UITextField *sulfurDioxide;
@property (weak, nonatomic) IBOutlet UITextField *rain;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
