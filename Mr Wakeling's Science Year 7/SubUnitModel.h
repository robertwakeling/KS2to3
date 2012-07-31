//
//  SubUnitModel.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubUnitModel : NSObject

- (NSArray *) getTheSubUnitArray:(NSString *)string;
- (NSDictionary*)getDictionary;

@property (nonatomic, strong) NSArray *subUnitArray;
@property (nonatomic, strong) NSDictionary *subUnitDictionary;

@end
