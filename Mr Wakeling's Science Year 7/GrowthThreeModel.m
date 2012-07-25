//
//  GrowthThreeModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 24/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GrowthThreeModel.h"

@implementation GrowthThreeModel
@synthesize theModelDictionary;

-(NSDictionary *)getTheModelDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"GrowthThreeText" ofType:@"plist"];
    theModelDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return theModelDictionary;
}


@end
