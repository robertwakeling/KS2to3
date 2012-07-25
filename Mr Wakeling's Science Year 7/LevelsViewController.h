//
//  LevelsViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 27/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MicroscopeThreeViewController.h"
#import "PlanetaryOrderViewController.h"

@class LevelsModel;

@interface LevelsViewController : UITableViewController
/*
{
    NSArray *levels;
    NSMutableArray *levelDescriptors;
}

@property (nonatomic, strong) NSArray *levels;
@property (nonatomic, strong) NSMutableArray *levelDescriptors;
@property (nonatomic, strong) NSDictionary *levelDict;
@property (nonatomic, strong) NSDictionary *secondTemp;
*/
 
@property (nonatomic, strong) NSString *unitToSubUnit;
@property (nonatomic, retain) NSString *secondSubUnitToLevel;
@property (nonatomic, retain) NSString *subUnitToLevel;
@property LevelsModel *levelModel;

@end
