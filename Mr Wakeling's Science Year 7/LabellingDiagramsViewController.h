//
//  LabellingDiagramsViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 24/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MicroscopeModel.h"
#import "BigBrain.h"
#import "OverallLevelThreeViewController.h"

@class MicroscopeModel;
@class BigBrain;

@interface LabellingDiagramsViewController : UIViewController
{
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;
    int x;
    
    NSArray *allTextfields;
    NSArray *allTicks;
    
    NSString *eyepieceString;
    NSString *objectiveLensString;
    NSString *focussingString;
    NSString *stageString;
    NSString *mirrorString;
    NSString *finalScoreString;
    
    UITextField *currentTextField;
    
}

@property (weak, nonatomic) IBOutlet UITextField *eyepiece;
@property (weak, nonatomic) IBOutlet UIImageView *eyepieceTick;
@property (weak, nonatomic) IBOutlet UITextField *objectiveLenses;
@property (weak, nonatomic) IBOutlet UIImageView *objectiveTick;
@property (weak, nonatomic) IBOutlet UITextField *focussingKnobs;
@property (weak, nonatomic) IBOutlet UIImageView *focussingTick;
@property (weak, nonatomic) IBOutlet UITextField *stage;
@property (weak, nonatomic) IBOutlet UIImageView *stageTick;
@property (weak, nonatomic) IBOutlet UITextField *mirror;
@property (weak, nonatomic) IBOutlet UIImageView *mirrorTick;
@property(nonatomic, readonly, getter=isEditing) BOOL editing;
@property (weak, nonatomic) IBOutlet UILabel *microscopeScoreLabel;
@property (strong, nonatomic) NSString *finalMicroscopeScore;

@property MicroscopeModel *microscopeBrain;
@property BigBrain *theBigBrain;

-(IBAction)saveUserEntries;
-(void)preparationOfFields: (NSArray *)allTheFields: (NSArray *)allTheTicks;


@end