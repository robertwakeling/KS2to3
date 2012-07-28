//
//  AdaptationThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 27/07/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface AdaptationThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int theScore;
    
}

@property (weak, nonatomic) IBOutlet UITextField *light;
@property (weak, nonatomic) IBOutlet UITextField *temperature;

@property (weak, nonatomic) IBOutlet UITextField *spring;
@property (weak, nonatomic) IBOutlet UITextField *summer;
@property (weak, nonatomic) IBOutlet UITextField *autumn;
@property (weak, nonatomic) IBOutlet UITextField *winter;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
