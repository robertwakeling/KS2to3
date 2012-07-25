//
//  SubUnitViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 27/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LevelsViewController.h"

@class SubUnitModel;

@interface SubUnitViewController : UITableViewController
/*
{
    NSMutableArray *units;
}

@property (nonatomic, strong) NSArray *subUnits;
@property (nonatomic, strong) NSDictionary *subDict;
@property (nonatomic, strong) NSDictionary *scienceUnits;
*/
@property SubUnitModel *sUnitModel;
@property (nonatomic, retain) NSString *unitToSubUnit;

@end
