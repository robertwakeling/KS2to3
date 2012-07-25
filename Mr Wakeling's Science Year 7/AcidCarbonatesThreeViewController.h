//
//  AcidCarbonatesThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface AcidCarbonatesThreeViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UITextField *answer;

-(IBAction)testYourself:(id)sender;

@end
