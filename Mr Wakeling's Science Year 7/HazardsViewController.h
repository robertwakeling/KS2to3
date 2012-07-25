//
//  HazardsViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TextfieldCheckerViewController.h"
#import "HazardModel.h"
#import "GenericProtocol.h"
#import "Tester.h"

@interface HazardsViewController : TextfieldCheckerViewController <GenericProtocol>
{
    NSString *harmfulString;
    NSString *irritantString;
    NSString *flammableString;
    NSString *toxicString;
    NSString *oxidisingString;
    NSString *corrosiveString;
}
@property (weak, nonatomic) IBOutlet UITextField *harmful;
@property (weak, nonatomic) IBOutlet UITextField *irritant;
@property (weak, nonatomic) IBOutlet UITextField *flammable;
@property (weak, nonatomic) IBOutlet UITextField *toxic;
@property (weak, nonatomic) IBOutlet UITextField *oxidising;
@property (weak, nonatomic) IBOutlet UITextField *corrosive;

@property (weak, nonatomic) IBOutlet UIImageView *harmfulTick;
@property (weak, nonatomic) IBOutlet UIImageView *irritantTick;
@property (weak, nonatomic) IBOutlet UIImageView *flammableTick;
@property (weak, nonatomic) IBOutlet UIImageView *toxicTick;
@property (weak, nonatomic) IBOutlet UIImageView *oxidisingTick;
@property (weak, nonatomic) IBOutlet UIImageView *corrosiveTick;

@property (weak, nonatomic) IBOutlet UILabel *hazardsLabel;

@property HazardModel *theHazardModel;

@end
