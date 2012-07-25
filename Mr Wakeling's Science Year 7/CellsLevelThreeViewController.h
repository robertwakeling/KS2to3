//
//  CellsLevelThreeViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TextfieldCheckerViewController.h"
#import "CellsModel.h"
#import "GenericProtocol.h"
#import "Tester.h"

@interface CellsLevelThreeViewController : TextfieldCheckerViewController <GenericProtocol>
{
    NSString *animalNucleus;
    NSString *animalCytoplasm;
    NSString *animalCellMembrane;
    NSString *plantCellMembrane;
    NSString *plantNucleus;
    NSString *plantChloroplast;
    NSString *plantVacuole;
    NSString *plantCellWall;
    NSString *plantCytoplasm;
}

@property (weak, nonatomic) IBOutlet UITextField *aNucleus;
@property (weak, nonatomic) IBOutlet UITextField *aCytoplasm;
@property (weak, nonatomic) IBOutlet UITextField *aCellMembrane;
@property (weak, nonatomic) IBOutlet UITextField *pCellMembrane;
@property (weak, nonatomic) IBOutlet UITextField *pNucleus;
@property (weak, nonatomic) IBOutlet UITextField *pChloroplast;
@property (weak, nonatomic) IBOutlet UITextField *pVacuole;
@property (weak, nonatomic) IBOutlet UITextField *pCellWall;
@property (weak, nonatomic) IBOutlet UITextField *pCytoplasm;

@property (weak, nonatomic) IBOutlet UIImageView *aNTick;
@property (weak, nonatomic) IBOutlet UIImageView *aCTick;
@property (weak, nonatomic) IBOutlet UIImageView *aCMTick;
@property (weak, nonatomic) IBOutlet UIImageView *pCMTick;
@property (weak, nonatomic) IBOutlet UIImageView *pNTick;
@property (weak, nonatomic) IBOutlet UIImageView *pChTick;
@property (weak, nonatomic) IBOutlet UIImageView *pVTick;
@property (weak, nonatomic) IBOutlet UIImageView *pCWTick;
@property (weak, nonatomic) IBOutlet UIImageView *pCTick;

@property (weak, nonatomic) IBOutlet UILabel *cellScoreLabel;

@property CellsModel *theCellModel;

@end
