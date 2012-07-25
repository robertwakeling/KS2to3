//
//  VariationThree.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 25/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TextfieldCheckerViewController.h"
#import "GenericProtocol.h"
#import "Tester.h"
#import "VariationThreeModel.h"

@interface VariationThree : TextfieldCheckerViewController <GenericProtocol>
{
    NSString *sizeString;
    NSString *colourString;
    NSString *genderString;
}

@property (weak, nonatomic) IBOutlet UITextField *sizeField;
@property (weak, nonatomic) IBOutlet UITextField *colourField;
@property (weak, nonatomic) IBOutlet UITextField *genderField;

@property (weak, nonatomic) IBOutlet UIImageView *sizeTick;
@property (weak, nonatomic) IBOutlet UIImageView *colourTick;
@property (weak, nonatomic) IBOutlet UIImageView *genderTick;

@property (weak, nonatomic) IBOutlet UILabel *theScoreLabel;

@property VariationThreeModel *theVariationThreeModel;

@end
