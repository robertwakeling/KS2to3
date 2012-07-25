//
//  PlanetModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by Leon Ormes on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PlanetModel.h"

@implementation PlanetModel
@synthesize theModelDictionary;

- (NSDictionary *) getTheModelDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Planet plist" ofType:@"plist"];
    theModelDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
        
    return theModelDictionary;
}

@end
