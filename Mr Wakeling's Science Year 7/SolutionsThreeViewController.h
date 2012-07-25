//
//  SolutionsThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 21/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface SolutionsThreeViewController : UIViewController <UIAlertViewDelegate>
{
    BOOL mouseSwiped;
    CGPoint lastPoint;
    int a, b, c, d, e, theScore;
    BOOL first, second, third, fourth, fifth;
}

@property (weak, nonatomic) IBOutlet UIImageView *drawImage;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
