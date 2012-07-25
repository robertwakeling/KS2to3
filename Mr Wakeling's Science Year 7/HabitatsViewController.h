//
//  HabitatsViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Tester.h"

@interface HabitatsViewController : UIViewController
{
    NSArray *theLabels;
}

@property (weak, nonatomic) IBOutlet UILabel *desert;
@property (weak, nonatomic) IBOutlet UILabel *woodland;
@property (weak, nonatomic) IBOutlet UILabel *coastal;
@property (weak, nonatomic) IBOutlet UILabel *polar;

@property (nonatomic, getter = isHidden) BOOL hidden;

@end
