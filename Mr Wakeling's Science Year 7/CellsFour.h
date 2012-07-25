//
//  CellsFour.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 04/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DraggingViewController.h"
#import "DraggingProtocol.h"
#import "CellsFourViewController.h"

@interface CellsFour : DraggingViewController <theDraggingProtocol>

@property (weak, nonatomic) IBOutlet UIButton *nucleus;
@property (weak, nonatomic) IBOutlet UIButton *cellWall;
@property (weak, nonatomic) IBOutlet UIButton *cellMembrane;
@property (weak, nonatomic) IBOutlet UIButton *chloroplast;
@property (weak, nonatomic) IBOutlet UIButton *cytoplasm;
@property (weak, nonatomic) IBOutlet UIButton *vacuole;

@property (weak, nonatomic) IBOutlet UIImageView *nucleusTick;
@property (weak, nonatomic) IBOutlet UIImageView *cellWallTick;
@property (weak, nonatomic) IBOutlet UIImageView *cellMembraneTick;
@property (weak, nonatomic) IBOutlet UIImageView *chloroplastTick;
@property (weak, nonatomic) IBOutlet UIImageView *cytoplasmTick;
@property (weak, nonatomic) IBOutlet UIImageView *vacuoleTick;

@end
