//
//  MicroscopeModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MicroscopeModel.h"

@implementation MicroscopeModel
@synthesize theModelDictionary;

-(NSDictionary *)getTheDictionary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"7A Cells Microscopes 3" ofType:@"plist"];
    theModelDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];

    return theModelDictionary;    
}

@end
