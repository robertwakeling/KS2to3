//
//  MatterThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 15/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface MatterThreeViewController : UIViewController <UIAlertViewDelegate>
{
    int theScore;
    NSArray *objects;
    NSDictionary *objectDictionary;
    NSUInteger arrayPosition;
}

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *images;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UIButton *Solid;
@property (weak, nonatomic) IBOutlet UIButton *Liquid;
@property (weak, nonatomic) IBOutlet UIButton *Gas;

@end
