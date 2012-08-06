//
//  TypesViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by Robert Wakeling on 06/08/2012.
//
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface TypesViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    int theScore;
}
@property (weak, nonatomic) IBOutlet UITextField *egg;
@property (weak, nonatomic) IBOutlet UITextField *sperm;
@property (weak, nonatomic) IBOutlet UITextField *fertilisation;

@end
