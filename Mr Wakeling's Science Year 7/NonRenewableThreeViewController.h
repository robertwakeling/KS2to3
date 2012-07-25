//
//  NonRenewableThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 24/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface NonRenewableThreeViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
{
    int coalInt;
    int oilInt;
    int gasInt;
}
@property (weak, nonatomic) IBOutlet UITextField *coal;
@property (weak, nonatomic) IBOutlet UITextField *oil;
@property (weak, nonatomic) IBOutlet UITextField *gas;

@end
