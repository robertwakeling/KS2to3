//
//  CellsFourViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TextfieldCheckerViewController.h"
#import "GenericProtocol.h"
#import "Tester.h"
#import "CellsFourModel.h"

@interface CellsFourViewController : TextfieldCheckerViewController <GenericProtocol>
{
    NSString *nucleusString2;
    NSString *cellWallString2;
    NSString *cellMembraneString2;
    NSString *chloroplastString2;
    NSString *cytoplasmString2;
    NSString *vacuoleString2;
}

@property (weak, nonatomic) IBOutlet UITextField *nucleusField;
@property (weak, nonatomic) IBOutlet UITextField *cellWallField;
@property (weak, nonatomic) IBOutlet UITextField *cellMembraneField;
@property (weak, nonatomic) IBOutlet UITextField *chloroplastField;
@property (weak, nonatomic) IBOutlet UITextField *cytoplasmField;
@property (weak, nonatomic) IBOutlet UITextField *vacuoleField;

@property (weak, nonatomic) IBOutlet UIImageView *nucleusTick;
@property (weak, nonatomic) IBOutlet UIImageView *cellWallTick;
@property (weak, nonatomic) IBOutlet UIImageView *cellMembraneTick;
@property (weak, nonatomic) IBOutlet UIImageView *chloroplastTick;
@property (weak, nonatomic) IBOutlet UIImageView *cytoplasmTick;
@property (weak, nonatomic) IBOutlet UIImageView *vacuoleTick;

@property (weak, nonatomic) IBOutlet UILabel *theScoreLabel;

@property CellsFourModel *theCellsFourModel;

@end
