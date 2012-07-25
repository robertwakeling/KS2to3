//
//  BigBrain.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BigBrain : NSObject

-(int) calculateTheScore:(UITextField *)theTextfield: (NSDictionary *)theDictionary: (NSString *)theTextfieldTag: (NSArray *)allTextfields: (NSArray *)allImageTicks;

@property int theScore;

-(void)genericSave: (UITextField *) aTextField :(NSArray *)allTextFields :(NSString *)theFieldText :(NSString *)theKey;

@end
