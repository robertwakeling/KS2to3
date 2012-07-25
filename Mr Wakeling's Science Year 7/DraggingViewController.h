//
//  DraggingViewController.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 13/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tester.h"

@interface DraggingViewController : UIViewController
{
    // add IBOutlets for the UIImageView s that need to be moved
    
    // an NSArray to hold the buttons
    
    NSArray *theButtons;
    
    // NSUserDefaults to save the user positions
    
    NSUserDefaults *thePositions;
    
    // NSDictionary for the co-ordinates and keyStrings
    
    NSDictionary *theDictionary;
    
    // NSArray to hold the ticks
   
    NSArray *theTicks;
    
    int theScore;
    IBOutlet UILabel *theScoreLabel;
}

// Don't forget to change the tags on the imageViews!!

-(IBAction)resetTheImages;

-(IBAction)clickingTheSaveButton;

@end
