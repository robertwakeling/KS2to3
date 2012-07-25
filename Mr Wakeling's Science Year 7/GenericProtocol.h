//
//  GenericProtocol.h
//  Mr Wakeling's Science Year 7
//
//  Created by Leon Ormes on 29/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GenericProtocol <NSObject>
@required
// Methods that need to be overridden

-(NSArray *)LowTextFieldsThatNeedTheViewToMove;
-(void)preparationOfTextFields_TickImages_TextStringsAndUserDefaultKeys;
-(void)retrieveTheModelClass;
-(NSDictionary *)retrieveTheModelDictionary;
-(UILabel *)justReturnTheLabelObject;

-(IBAction)transitionToAnotherController;

@end

@interface GenericProtocol : NSObject

@end
