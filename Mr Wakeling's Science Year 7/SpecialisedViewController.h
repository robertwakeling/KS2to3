//
//  SpecialisedViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 19/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface SpecialisedViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    int theScore;
}

@property (weak, nonatomic) IBOutlet UILabel *shape;
@property (weak, nonatomic) IBOutlet UILabel *size;
@property (weak, nonatomic) IBOutlet UILabel *presenceNucleus;

@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UITextField *correctAnswerEntry;

@property (nonatomic, getter = isHidden) BOOL hidden;

@end
