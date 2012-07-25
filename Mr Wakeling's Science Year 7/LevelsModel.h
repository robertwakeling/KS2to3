//
//  LevelsModel.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LevelsModel : NSObject
{
    NSDictionary *levelDescriptors;
}

-(NSArray *) getTheLevels:(NSString *)string:(NSString *)secondString;
-(NSDictionary *) getTheDescriptors:(NSString *)string:(NSString *)secondString;

@property (nonatomic, strong) NSArray *levelArray;
@property (nonatomic, strong) NSDictionary *levelDescriptorsFinal;

@end
