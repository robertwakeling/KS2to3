//
//  CurrentThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 29/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface CurrentThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int theScore;
    
}

@property (weak, nonatomic) IBOutlet UITextField *current;
@property (weak, nonatomic) IBOutlet UITextField *ammeter;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
