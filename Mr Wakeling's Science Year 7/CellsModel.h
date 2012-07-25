//
//  CellsModel.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 23/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BigBrain.h"

@interface CellsModel : BigBrain

@property (nonatomic, strong) NSDictionary *cellDictionary;

- (NSDictionary*) getTheDictionary;

@end
