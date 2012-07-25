//
//  GrowthThree.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 24/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TextfieldCheckerViewController.h"
#import "GenericProtocol.h"
#import "Tester.h"
#import "GrowthThreeModel.h"

@interface GrowthThree : TextfieldCheckerViewController <GenericProtocol>
{
    NSString *copyingString;
    NSString *dividingString;
    NSString *daughterString;
}

@property (weak, nonatomic) IBOutlet UITextField *copying;
@property (weak, nonatomic) IBOutlet UITextField *dividing;
@property (weak, nonatomic) IBOutlet UITextField *daughterCells;

@property (weak, nonatomic) IBOutlet UIImageView *copyingTick;
@property (weak, nonatomic) IBOutlet UIImageView *divideTick;
@property (weak, nonatomic) IBOutlet UIImageView *daughterTick;

@property (weak, nonatomic) IBOutlet UILabel *theScoreLabel;

@property GrowthThreeModel *theGrowthThreeModel;

@end
