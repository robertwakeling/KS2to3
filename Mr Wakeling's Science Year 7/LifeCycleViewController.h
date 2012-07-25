//
//  LifeCycleViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 20/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface LifeCycleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *adolescence;
@property (weak, nonatomic) IBOutlet UILabel *adulthood;
@property (weak, nonatomic) IBOutlet UILabel *birth;
@property (weak, nonatomic) IBOutlet UILabel *reproduction;
@property (weak, nonatomic) IBOutlet UILabel *fertilisation;

@property (nonatomic, getter = isHidden) BOOL hidden;

@end
