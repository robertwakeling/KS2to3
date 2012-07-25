//
//  CellsLevelThreeViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CellsLevelThreeViewController.h"

@interface CellsLevelThreeViewController ()

@end

@implementation CellsLevelThreeViewController
@synthesize aNucleus;
@synthesize aCytoplasm;
@synthesize aCellMembrane;
@synthesize pCellMembrane;
@synthesize pNucleus;
@synthesize pChloroplast;
@synthesize pVacuole;
@synthesize pCellWall;
@synthesize pCytoplasm;
@synthesize aNTick;
@synthesize aCTick;
@synthesize aCMTick;
@synthesize pCMTick;
@synthesize pNTick;
@synthesize pChTick;
@synthesize pVTick;
@synthesize pCWTick;
@synthesize pCTick;
@synthesize cellScoreLabel;
@synthesize theCellModel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)preparationOfTextFields_TickImages_TextStringsAndUserDefaultKeys
{
    allTextFields = [[NSArray alloc] initWithObjects:aNucleus, aCytoplasm, aCellMembrane, pCellMembrane, pNucleus, pChloroplast, pVacuole, pCellWall, pCytoplasm, nil];
    allOfTheTextStrings = [[NSArray alloc] initWithObjects:animalNucleus, animalCytoplasm, animalCellMembrane, plantCellMembrane, plantNucleus, plantChloroplast, plantVacuole, plantCellWall, plantCytoplasm, nil];
    theUserDefaultKeys = [[NSArray alloc] initWithObjects:@"aNucleusKey",@"aCytoplasmKey",@"aCellMembraneKey",@"pCellMembraneKey",@"pNucleusKey",@"pChloroplastKey",@"pVacuoleKey",@"pCellWallKey",@"pCytoplasmKey", nil];
    allTickImages = [[NSArray alloc] initWithObjects:aNTick, aCTick, aCMTick, pCMTick, pNTick, pChTick, pVTick, pCWTick, pCTick, nil];
    
}


-(UILabel *)justReturnTheLabelObject
{
    return cellScoreLabel;
}

-(NSArray *)LowTextFieldsThatNeedTheViewToMove
{
    theTextFieldsThatNeedMoving = [[NSArray alloc] initWithObjects:pChloroplast, pVacuole, pCellWall, pCytoplasm, nil];
    return theTextFieldsThatNeedMoving;
}

-(void)retrieveTheModelClass
{
    theCellModel = [[CellsModel alloc] init];
}

-(NSDictionary *)retrieveTheModelDictionary
{
    [self retrieveTheModelClass];
    [theCellModel getTheDictionary];
    theModelDictionary = theCellModel.cellDictionary;
    
    return theModelDictionary;
}

- (void)viewDidLoad
{
    [self retrieveTheModelDictionary];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)transitionToAnotherController
{
    if (theScore == [allTextFields count]) {
        Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
        [self.navigationController pushViewController:detail animated:YES];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Cells3" object:self];
    }
}

- (void)viewDidUnload
{
    [self setANucleus:nil];
    [self setACytoplasm:nil];
    [self setACellMembrane:nil];
    [self setPCellMembrane:nil];
    [self setPNucleus:nil];
    [self setPVacuole:nil];
    [self setPChloroplast:nil];
    [self setPCellWall:nil];
    [self setPCytoplasm:nil];
    [self setANTick:nil];
    [self setACMTick:nil];
    [self setACTick:nil];
    [self setACMTick:nil];
    [self setPCMTick:nil];
    [self setPNTick:nil];
    [self setPChTick:nil];
    [self setPVTick:nil];
    [self setPCWTick:nil];
    [self setPCTick:nil];
    [self setCellScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
