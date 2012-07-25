//
//  MicroscopeThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 05/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TextfieldCheckerViewController.h"
#import "MicroscopeModel.h"
#import "GenericProtocol.h"
#import "Tester.h"


@interface MicroscopeThreeViewController : TextfieldCheckerViewController <GenericProtocol>
{
    NSString * eyepieceString;
    NSString * objectiveString;
    NSString * focussingString;
    NSString * stageString;
    NSString * mirrorString;
}

@property (weak, nonatomic) IBOutlet UITextField *eyepiece;
@property (weak, nonatomic) IBOutlet UITextField *objectiveLenses;
@property (weak, nonatomic) IBOutlet UITextField *focussingKnobs;
@property (weak, nonatomic) IBOutlet UITextField *stage;
@property (weak, nonatomic) IBOutlet UITextField *mirror;

@property (weak, nonatomic) IBOutlet UIImageView *eyepieceTick;
@property (weak, nonatomic) IBOutlet UIImageView *objectiveTick;
@property (weak, nonatomic) IBOutlet UIImageView *focussingTick;
@property (weak, nonatomic) IBOutlet UIImageView *stageTick;
@property (weak, nonatomic) IBOutlet UIImageView *mirrorTick;

@property (weak, nonatomic) IBOutlet UILabel *microscopeScoreLabel;

@property MicroscopeModel *theMicroscopeModel;

@end
