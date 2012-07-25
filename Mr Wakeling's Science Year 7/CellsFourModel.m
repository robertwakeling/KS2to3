//
//  CellsFourModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 10/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CellsFourModel.h"

@implementation CellsFourModel
@synthesize theModelDictionary;

-(NSDictionary *)getTheModelDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"CellsFourText" ofType:@"plist"];
    theModelDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return theModelDictionary;
}

@end
