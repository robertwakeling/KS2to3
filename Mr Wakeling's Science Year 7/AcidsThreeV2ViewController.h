//
//  AcidsThreeV2ViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 03/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AcidsThreeTesterViewController.h"

@interface AcidsThreeV2ViewController : UIViewController
{
    NSDictionary *theAnswers;
    NSString *temp;
    
    int theScore;
    
}

@property (weak, nonatomic) IBOutlet UIButton *lemon;
@property (weak, nonatomic) IBOutlet UIButton *vinegar;
@property (weak, nonatomic) IBOutlet UIButton *shampoo;
@property (weak, nonatomic) IBOutlet UIButton *bleach;
@property (weak, nonatomic) IBOutlet UIButton *cleaner;
@property (weak, nonatomic) IBOutlet UIButton *cola;
@property (weak, nonatomic) IBOutlet UIButton *hydroxide;

@property (weak, nonatomic) IBOutlet UILabel *theScoreLabel;

@end
