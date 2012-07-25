//
//  TesterViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 14/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DraggingViewController.h"
#import "DraggingProtocol.h"

@interface TesterViewController : DraggingViewController <theDraggingProtocol>

@property (weak, nonatomic) IBOutlet UIImageView *first;
@property (weak, nonatomic) IBOutlet UIImageView *second;
@property (weak, nonatomic) IBOutlet UIImageView *third;

@property (weak, nonatomic) IBOutlet UIButton *fourth;
@property (weak, nonatomic) IBOutlet UIButton *fifth;
@end
