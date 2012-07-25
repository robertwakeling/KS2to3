//
//  UnitViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 27/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class units;

@interface UnitViewController : UITableViewController
{
//    NSArray *unitsArray;
 //   NSMutableArray *unitTitles;
 //   NSDictionary *scienceUnitsDict;
}

//@property (nonatomic, strong) NSArray *unitsArray;
//@property (nonatomic, strong) NSMutableArray *unitTitles;
//@property (nonatomic, strong) NSDictionary *scienceUnitsDict;

@property units * unitModel;

-(IBAction)viewOverallLevel;

@end
