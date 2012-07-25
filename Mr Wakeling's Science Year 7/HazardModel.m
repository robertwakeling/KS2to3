//
//  HazardModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HazardModel.h"

@implementation HazardModel
@synthesize theModelDictionary;

-(NSDictionary *)getTheModelDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Hazards" ofType:@"plist"];
    theModelDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return theModelDictionary;
}

@end
