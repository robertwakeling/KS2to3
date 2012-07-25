//
//  MixturesThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 21/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface MixturesThreeViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    int theScore;
}
@property (weak, nonatomic) IBOutlet UITextField *nitrogen;
@property (weak, nonatomic) IBOutlet UITextField *oxygen;
@property (weak, nonatomic) IBOutlet UITextField *carbonDioxide;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
