//
//  LevelsModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelsModel.h"

@implementation LevelsModel
@synthesize levelArray, levelDescriptorsFinal;

-(NSArray *) getTheLevels:(NSString *)string:(NSString *)secondString
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"plist"];
    levelDescriptors = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    NSArray *second = [[[[levelDescriptors valueForKey:string] valueForKey:@"SubUnits"] valueForKey:secondString] allKeys];
    
    levelArray = [second sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    return levelArray;
}

-(NSDictionary *)getTheDescriptors:(NSString *)string :(NSString *)secondString
{
    levelDescriptorsFinal = [[[levelDescriptors valueForKey:string] valueForKey:@"SubUnits"] valueForKey:secondString];
    
  //  NSLog(@"%@", levelDescriptorsFinal);
    
    return levelDescriptorsFinal;
}

@end
