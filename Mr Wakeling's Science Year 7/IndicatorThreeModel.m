//
//  IndicatorThreeModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 06/07/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IndicatorThreeModel.h"

@implementation IndicatorThreeModel
@synthesize theModelDictionary;

-(NSDictionary *)getTheDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Indicator3" ofType:@"plist"];
    theModelDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    return theModelDictionary;    
}
@end
