//
//  units.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 18/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "units.h"

@implementation units
@synthesize unitArray;
@synthesize theDictionary;

-(NSArray *)getTheArray
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"plist"];
    theDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    unitArray = [[theDictionary allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    return unitArray;
}

@end
