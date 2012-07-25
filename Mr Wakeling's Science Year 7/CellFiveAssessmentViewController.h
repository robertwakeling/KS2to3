//
//  CellFiveAssessmentViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface CellFiveAssessmentViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

{
    // To move the view up and down for text fields
    BOOL viewShiftedForKeyboard;
    NSTimeInterval keyboardSlideDuration;
    CGFloat keyboardShiftAmount;
    
    int theScore;

}

@property (weak, nonatomic) IBOutlet UILabel *nucleus;
@property (weak, nonatomic) IBOutlet UILabel *cellMembrane;
@property (weak, nonatomic) IBOutlet UILabel *cytoplasm;
@property (weak, nonatomic) IBOutlet UILabel *cellWall;
@property (weak, nonatomic) IBOutlet UILabel *chloroplast;
@property (weak, nonatomic) IBOutlet UILabel *vacuole;

@property (nonatomic, getter = isHidden) BOOL hidden;

@property (weak, nonatomic) IBOutlet UITextField *scoreField;

-(IBAction)hideShowLabel:(UIButton *)sender: (UILabel *)theLabel;

-(IBAction)checkScores;

@end
