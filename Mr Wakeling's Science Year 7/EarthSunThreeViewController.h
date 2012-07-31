//
//  EarthSunThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 31/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface EarthSunThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int theScore;
}

@property (weak, nonatomic) IBOutlet UITextField *earth;
@property (weak, nonatomic) IBOutlet UITextField *sun;
@property (weak, nonatomic) IBOutlet UITextField *duration;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
