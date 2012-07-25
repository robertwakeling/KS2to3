//
//  AcidsThreeTesterViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 03/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface AcidsThreeTesterViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIAlertViewDelegate>
{
    NSArray *acidsAlkalis;
    NSDictionary *theAnswers;
    NSInteger theSelectedRow;
    
    int theScore;
}

@property (weak, nonatomic) IBOutlet UIPickerView *acidAlkaliPicker;
@property (weak, nonatomic) IBOutlet UIImageView *tickView;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewer;

@property (weak, nonatomic) IBOutlet UILabel *theScoreLabel;

@end
