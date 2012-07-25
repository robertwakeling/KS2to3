//
//  FuelsThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 15/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface FuelsThreeViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    NSDictionary *textfields;

}

@property (weak, nonatomic) IBOutlet UITextField *energy;
@property (weak, nonatomic) IBOutlet UITextField *co2;

@property (weak, nonatomic) IBOutlet UIImageView *energyTick;
@property (weak, nonatomic) IBOutlet UIImageView *co2Tick;

@end
