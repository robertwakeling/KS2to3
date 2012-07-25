//
//  IndicatorsThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 06/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextfieldCheckerViewController.h"
#import "GenericProtocol.h"
#import "Tester.h"
#import "IndicatorThreeModel.h"

@interface IndicatorsThreeViewController : TextfieldCheckerViewController <GenericProtocol>
{
    NSString * acidString;
    NSString * neutralString;
    NSString * alkaliString;
    NSString * universalString;
    NSString * redString;
    NSString * orangeString;
    NSString * yellowString;
    NSString * greenString;
    NSString * blueString;
    NSString * indigoString;
    NSString * violetString;
}

@property (weak, nonatomic) IBOutlet UITextField *acid;
@property (weak, nonatomic) IBOutlet UIImageView *acidTick;
@property (weak, nonatomic) IBOutlet UITextField *neutral;
@property (weak, nonatomic) IBOutlet UIImageView *neutralTick;
@property (weak, nonatomic) IBOutlet UITextField *alkali;
@property (weak, nonatomic) IBOutlet UIImageView *alkaliTick;
@property (weak, nonatomic) IBOutlet UITextField *universalIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *universalTick;

@property (weak, nonatomic) IBOutlet UITextField *red;
@property (weak, nonatomic) IBOutlet UIImageView *redTick;
@property (weak, nonatomic) IBOutlet UITextField *orange;
@property (weak, nonatomic) IBOutlet UIImageView *orangeTick;
@property (weak, nonatomic) IBOutlet UITextField *yellow;
@property (weak, nonatomic) IBOutlet UIImageView *yellowTick;
@property (weak, nonatomic) IBOutlet UITextField *green;
@property (weak, nonatomic) IBOutlet UIImageView *greenTick;
@property (weak, nonatomic) IBOutlet UITextField *blue;
@property (weak, nonatomic) IBOutlet UIImageView *blueTick;
@property (weak, nonatomic) IBOutlet UITextField *indigo;
@property (weak, nonatomic) IBOutlet UIImageView *indigoTick;
@property (weak, nonatomic) IBOutlet UITextField *violet;
@property (weak, nonatomic) IBOutlet UIImageView *violetTick;

@property (weak, nonatomic) IBOutlet UILabel *theScoreLabel;

@property IndicatorThreeModel *theIndicatorThreeModel;

@end
