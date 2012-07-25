//
//  Tester.h
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 09/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Tester : UIViewController <UITableViewDelegate, UITableViewDataSource>

{
    IBOutlet UITableView *myTableView;
    NSArray *theArray;
    
    NSDictionary *theDictionary;
    NSString *path;
    
    NSUserDefaults *defaults;
    
    NSUserDefaults *maintainingTheArray;
    NSData *data;
    
    int theFinalScore;
    
    IBOutlet UIProgressView *overallProgress;
    
    NSMutableArray *levelThree;
    NSMutableArray *levelFour;
    NSMutableArray *levelFive;
    NSMutableArray *levelSix;
    
    NSMutableArray *allLevels;
    
    NSDictionary *levelThreeDict;
    NSDictionary *levelFourDict;
    NSDictionary *levelFiveDict;
    NSDictionary *levelSixDict;
    
    NSMutableArray *levelThreeFinal;
    NSMutableArray *levelFourFinal;
    NSMutableArray *levelFiveFinal;
    NSMutableArray *levelSixFinal;
}

-(IBAction)pushToFirstView;

@property (nonatomic, strong) IBOutlet UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *allCompletedTopics;
@property (nonatomic, strong) NSMutableArray *levelThree;
@property (nonatomic, strong) NSMutableArray *levelFour;
@property (nonatomic, strong) NSMutableArray *levelFive;
@property (nonatomic, strong) NSMutableArray *levelSix;

@property (weak, nonatomic) IBOutlet UIProgressView *levelThreeProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *levelFourProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *levelFiveProgress;
@property (weak, nonatomic) IBOutlet UIProgressView *levelSixProgress;
@property (nonatomic, strong) IBOutlet UIProgressView *overallProgress;

@property (weak, nonatomic) IBOutlet UILabel *finalOverallLevel;

@property (weak, nonatomic) IBOutlet UILabel *three;
@property (weak, nonatomic) IBOutlet UILabel *four;
@property (weak, nonatomic) IBOutlet UILabel *five;
@property (weak, nonatomic) IBOutlet UILabel *six;
@property (weak, nonatomic) IBOutlet UILabel *overall;
@end
