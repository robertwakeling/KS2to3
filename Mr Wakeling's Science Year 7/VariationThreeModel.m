//
//  VariationThreeModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 25/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VariationThreeModel.h"

@implementation VariationThreeModel
@synthesize theModelDictionary;

-(NSDictionary *)getTheModelDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"VariationThree" ofType:@"plist"];
    theModelDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return theModelDictionary;
}

@end
