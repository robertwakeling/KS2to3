//
//  ForcesThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 30/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface ForcesThreeViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    int theScore;
}

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UITextField *weight;
@property (weak, nonatomic) IBOutlet UITextField *airResistance;
@property (weak, nonatomic) IBOutlet UITextField *friction;
@property (weak, nonatomic) IBOutlet UITextField *thrust;

@end
