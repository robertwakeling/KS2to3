//
//  SubUnitModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SubUnitModel.h"

@implementation SubUnitModel

@synthesize subUnitArray;

-(NSArray *)getTheSubUnitArray:(NSString *)string
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"plist"];
    NSDictionary *temp = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSArray *second = [[[temp valueForKey:string] valueForKey:@"SubUnits"] allKeys];
    
    subUnitArray = [second sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    return subUnitArray;
}

@end
