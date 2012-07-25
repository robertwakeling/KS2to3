//
//  CellDescriptionFiveViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellDescriptionFiveViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nucleusLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellMembraneLabel;
@property (weak, nonatomic) IBOutlet UILabel *cytoplasmLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellWallLabel;
@property (weak, nonatomic) IBOutlet UILabel *chloroplastLabel;
@property (weak, nonatomic) IBOutlet UILabel *vacuoleLabel;

@property (nonatomic, getter=isHidden) BOOL hidden;

-(IBAction)hideShowLabels;

@end
