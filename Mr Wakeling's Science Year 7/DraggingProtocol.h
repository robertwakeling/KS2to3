//
//  DraggingProtocol.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 13/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol theDraggingProtocol <NSObject>

// Methods that need to be overridden

-(NSDictionary*)getTheDictionary;
//-(NSArray*)theMovingImageViews;
-(NSArray*)getTheTicks;
-(NSArray*)getTheButtons;
-(UILabel*)getTheLabel;

@end

@interface DraggingProtocol : NSObject

@end
