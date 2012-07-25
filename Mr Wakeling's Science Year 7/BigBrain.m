//
//  BigBrain.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 22/04/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BigBrain.h"

@implementation BigBrain
@synthesize theScore;

-(int) calculateTheScore:(UITextField *)theTextfield: (NSDictionary *)theDictionary: (NSString *)theTextfieldTag: (NSArray *)allTextfields: (NSArray *)allImageTicks
{
    UIImage *theTick = [UIImage imageNamed:@"Tick.png"];
    
    for (theTextfield in allTextfields) {
        if ([theTextfield.text isEqualToString:[[theDictionary valueForKey:theTextfieldTag] valueForKey:@"Answer"]]) {
            [[allImageTicks objectAtIndex:theTextfield.tag] setImage:theTick];
            theScore++;
          //  NSLog(@"%i", theScore);
            theTextfield.enabled = NO;
        }
    }  
    return theScore;

}

-(void)genericSave: (UITextField *) aTextField :(NSArray *)allTextFields :(NSString *)theFieldText :(NSString *)theKey
{
    for (aTextField in allTextFields) {
        
    if (aTextField.text != nil) {
        NSString *x = [[NSString alloc] initWithFormat:@"%@", aTextField];
        NSLog(@"this is x: %@", x);
        
        theFieldText = [[NSString alloc] initWithFormat:@"%@", aTextField.text];
        aTextField.text = theFieldText;
        NSString *y = [x stringByAppendingString:@"Default"];
        NSLog(@"This is y: %@", y);
     //   NSUserDefaults *@"%@", y = [NSUserDefaults standardUserDefaults];
        
    }
    }
}

@end
