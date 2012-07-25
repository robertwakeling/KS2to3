//
//  DiffusionThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 21/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface DiffusionThreeViewController : UIViewController
{
    NSArray *objects;
}

@property (weak, nonatomic) IBOutlet UILabel *one;
@property (weak, nonatomic) IBOutlet UILabel *two;
@property (weak, nonatomic) IBOutlet UILabel *three;
@property (weak, nonatomic) IBOutlet UIImageView *four;

@property (nonatomic, getter = isHidden) BOOL hidden;

- (IBAction)transition:(UIButton *)sender;

@end
