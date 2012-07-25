//
//  CellsModel.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 23/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CellsModel.h"

@implementation CellsModel
@synthesize cellDictionary;


-(NSDictionary *)getTheDictionary
{
    if (cellDictionary == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"7A Cells AP Cells 3" ofType:@"plist"];
        cellDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    
    return cellDictionary;
    
}

@end
