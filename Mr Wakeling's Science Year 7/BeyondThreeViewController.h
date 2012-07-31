//
//  BeyondThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 31/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface BeyondThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int theScore;
}

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UITextField *milkyWay;
@property (weak, nonatomic) IBOutlet UITextField *galaxy;
@property (weak, nonatomic) IBOutlet UITextField *universe;

@end
