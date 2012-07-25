//
//  Tester.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 09/06/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Tester.h"

@interface Tester ()

@end

@implementation Tester
@synthesize myTableView;
@synthesize allCompletedTopics;
@synthesize levelThreeProgress;
@synthesize levelFourProgress;
@synthesize levelFiveProgress;
@synthesize levelSixProgress;
@synthesize overallProgress;
@synthesize finalOverallLevel;
@synthesize three;
@synthesize four;
@synthesize five;
@synthesize six;
@synthesize overall;

@synthesize levelThree, levelFour, levelFive, levelSix;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)receiveNotification:(NSNotification *)notification
{
    
    if (!path) {
        
    
    path = [[NSBundle mainBundle] pathForResource:@"OverallDictionary" ofType:@"plist"];
    theDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSLog(@"Created upon notification");
    }
    
    NSArray *temporaryArray = [theDictionary allKeys];
    
    for (id key in temporaryArray) {
        if ([[notification name] isEqualToString:key]) {
            if (!allCompletedTopics) {
                allCompletedTopics = [[NSMutableArray alloc] init];
            }
            if (![allCompletedTopics containsObject:[[theDictionary valueForKey:key] valueForKey:@"Title"]]) {
                [allCompletedTopics addObject:[[theDictionary valueForKey:key] valueForKey:@"Title"]];
                defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:allCompletedTopics forKey:@"hi"];
                theFinalScore++;
                [[NSUserDefaults standardUserDefaults] setInteger:theFinalScore forKey:@"theFinalScore"];
                [self updateTheProgressView];
            }
        }
    }
    

    
    /*
    if ([[notification name] isEqualToString:@"Microscopes3"]) {
        
        if (!allCompletedTopics) {
            allCompletedTopics = [[NSMutableArray alloc] init];
            
        }
        if (![allCompletedTopics containsObject:@"Microscopes level 3"]) {
            [allCompletedTopics addObject:@"Microscopes level 3"];
            
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:allCompletedTopics forKey:@"hi"];
            theFinalScore++;
            [[NSUserDefaults standardUserDefaults] setInteger:theFinalScore forKey:@"theFinalScore"];
            
            [self updateTheProgressView];
        }
        
        //    NSLog(@"%@", allCompletedTopics);
    }
    if ([[notification name] isEqualToString:@"Cells3"]) {
        if (!allCompletedTopics) {
            allCompletedTopics = [[NSMutableArray alloc] init];
        }
        if (![allCompletedTopics containsObject:@"Cells level 3"]) {
            [allCompletedTopics addObject:@"Cells level 3"];
            
            
            
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:allCompletedTopics forKey:@"hi"];
            theFinalScore++;
            [[NSUserDefaults standardUserDefaults] setInteger:theFinalScore forKey:@"theFinalScore"];
            
                        [self updateTheProgressView];
        }
        //      NSLog(@"%@", allCompletedTopics);
    }
    if ([[notification name] isEqualToString:@"Cells4"]) {
        if (!allCompletedTopics) {
            allCompletedTopics = [[NSMutableArray alloc] init];
        }
        
        if (![allCompletedTopics containsObject:@"Cells level 4"]) {
            
            
            [allCompletedTopics addObject:@"Cells level 4"];
            
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:allCompletedTopics forKey:@"hi"];
            theFinalScore++;
            [[NSUserDefaults standardUserDefaults] setInteger:theFinalScore forKey:@"theFinalScore"];
            //   NSLog(@"%@", allCompletedTopics);
                        [self updateTheProgressView];
        }
    }
    
    if ([[notification name] isEqualToString:@"AcidSafety3"]) {
        if (!allCompletedTopics) {
            allCompletedTopics = [[NSMutableArray alloc] init];
        }
        
        if (![allCompletedTopics containsObject:@"Staying Safe level 3"]) {
            
            
            [allCompletedTopics addObject:@"Staying Safe level 3"];
            
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:allCompletedTopics forKey:@"hi"];
            theFinalScore++;
            [[NSUserDefaults standardUserDefaults] setInteger:theFinalScore forKey:@"theFinalScore"];
            //   NSLog(@"%@", allCompletedTopics);
                        [self updateTheProgressView];
        }
    }
    
    if ([[notification name] isEqualToString:@"SolarSystem4"]) {
        if (!allCompletedTopics) {
            allCompletedTopics = [[NSMutableArray alloc] init];
        }
        
        if (![allCompletedTopics containsObject:@"Solar System level 4"]) {
            
            
            [allCompletedTopics addObject:@"Solar System level 4"];
            
            defaults = [NSUserDefaults standardUserDefaults];
            [defaults setObject:allCompletedTopics forKey:@"hi"];
            theFinalScore++;
            [[NSUserDefaults standardUserDefaults] setInteger:theFinalScore forKey:@"theFinalScore"];
            //   NSLog(@"%@", allCompletedTopics);
                        [self updateTheProgressView];
        }
    }
    NSLog(@"%i", theFinalScore);
                [self updateTheProgressView];
     */
}


-(IBAction)pushToFirstView {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
            
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    allCompletedTopics = [[[NSUserDefaults standardUserDefaults] objectForKey:@"hi"] mutableCopy];
      
    [defaults setObject:allCompletedTopics forKey:@"theKey"];
    
    if (!path) {
        path = [[NSBundle mainBundle] pathForResource:@"OverallDictionary" ofType:@"plist"];
        theDictionary = [[NSDictionary alloc] initWithContentsOfFile:path];
      //  NSLog(@"Created on view did load");
    }

    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"Keys" ofType:@"plist"];
    NSArray *theKeys = [[NSArray alloc] initWithContentsOfFile:path1];
    
    for (NSString *theString in theKeys) {
        //  NSLog(@"%@", theString);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:theString object:nil];

    }  
        theFinalScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"theFinalScore"];

        [self updateTheProgressView];

   /*
    levelThree = [[NSMutableArray alloc] init];
    levelFour = [[NSMutableArray alloc] init];
    levelFive = [[NSMutableArray alloc] init];
    levelSix = [[NSMutableArray alloc] init];
    
    for (id object in allCompletedTopics) {
        if ([object rangeOfString:@"level 3"].location != NSNotFound) 
        {
            [levelThree addObject:object];
        }
        levelThreeDict = [NSDictionary dictionaryWithObject:levelThree forKey:@"Levels"];
        
        if ([object rangeOfString:@"level 4"].location != NSNotFound) 
        {
            [levelFour addObject:object];
        }
        levelFourDict = [NSDictionary dictionaryWithObject:levelFour forKey:@"Levels"];
        
        if ([object rangeOfString:@"level 5"].location != NSNotFound) 
        {
            [levelFive addObject:object];
        }
        levelFiveDict = [NSDictionary dictionaryWithObject:levelFive forKey:@"Levels"];
        
        if ([object rangeOfString:@"level 6"].location != NSNotFound) 
        {
            [levelSix addObject:object];
        }
        levelSixDict = [NSDictionary dictionaryWithObject:levelSix forKey:@"Levels"];
    }
    
    allLevels = [[NSMutableArray alloc] initWithObjects:levelThreeDict, levelFourDict, levelFiveDict, levelSixDict, nil];
*/
    
    /*  
     //   allCompletedTopics = [[NSUserDefaults standardUserDefaults] objectForKey:@"theKey"];
     //   if(allCompletedTopics)
     //   {
     //   allCompletedTopics = [NSKeyedUnarchiver unarchiveObjectWithData:data];
     //   }
     
     //   else{
     //     allCompletedTopics = [[NSMutableArray alloc] init];
     
     //     NSLog(@"Yes?");
     
     //    }
     
     //   defaults = [NSUserDefaults standardUserDefaults];
     
     //   data = [NSKeyedArchiver archivedDataWithRootObject:allCompletedTopics];
     
     // [defaults setObject:data forKey:@"myArrayKey"];
     
     // [self retrieveTheArray];
     */
    
    
    /* maintainingTheArray = [NSUserDefaults standardUserDefaults];
     [maintainingTheArray setObject:allCompletedTopics forKey:@"theKey"];
     
     NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"theKey"]);
     
     //   [allCompletedTopics addObject:@"microscopesLevel3"];
     
     //   NSLog(@"%@", allCompletedTopics);
     
     */
    
    
    
    /*    
    levelThree = [[NSMutableArray alloc] init];
    levelFour = [[NSMutableArray alloc] init];
    levelFive = [[NSMutableArray alloc] init];
    levelSix = [[NSMutableArray alloc] init];
    
    for (id object in allCompletedTopics) {
        if ([object rangeOfString:@"level 3"].location != NSNotFound) 
        {
            [levelThree addObject:object];
        }
        levelThreeDict = [NSDictionary dictionaryWithObject:levelThree forKey:@"Levels"];
        
        if ([object rangeOfString:@"level 4"].location != NSNotFound) 
        {
            [levelFour addObject:object];
        }
        levelFourDict = [NSDictionary dictionaryWithObject:levelFour forKey:@"Levels"];
        
        if ([object rangeOfString:@"level 5"].location != NSNotFound) 
        {
            [levelFive addObject:object];
        }
        levelFiveDict = [NSDictionary dictionaryWithObject:levelFive forKey:@"Levels"];
        
        if ([object rangeOfString:@"level 6"].location != NSNotFound) 
        {
            [levelSix addObject:object];
        }
        levelSixDict = [NSDictionary dictionaryWithObject:levelSix forKey:@"Levels"];
    }
    NSLog(@"%@", levelFiveDict);
    
    allLevels = [[NSMutableArray alloc] initWithObjects:levelThreeDict, levelFourDict, levelFiveDict, levelSixDict, nil];
    */
    
    
    
    /*
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"Mic" object:nil];   
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"Cells3" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"CellsFour" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"Hazards" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveNotification:) name:@"PlanetaryOrder" object:nil];
     */
    
}

-(void)creatingTheData
{
    
    
    if (!levelThree) {
        levelThree = [[NSMutableArray alloc] init];
    }
    if (!levelFour) {
        levelFour = [[NSMutableArray alloc] init];
    }
    if (!levelFive) {
        levelFive = [[NSMutableArray alloc] init];
    }
    if (!levelSix) {
        levelSix = [[NSMutableArray alloc] init];
    }
    
    levelThreeFinal = [[NSMutableArray alloc] initWithCapacity:48];
    levelFourFinal = [[NSMutableArray alloc] initWithCapacity:48];
    levelFiveFinal = [[NSMutableArray alloc] initWithCapacity:48];
    levelSixFinal = [[NSMutableArray alloc] initWithCapacity:48];
    
    //for (NSString *object in levelThree) {
    //    NSString *theTemp = [object substringToIndex:object.length - 8];
   //     [levelThreeFinal addObject:theTemp];
        //NSLog(@"%@", levelThreeFinal);
    //}
    
    for (NSString *object in allCompletedTopics) {
        if (([object rangeOfString:@"level 3"].location != NSNotFound) && (![levelThree containsObject:object]))
        {
          //  NSLog(@"%@", object);
            
            [levelThree addObject:object];
            NSString *theTemp = [object substringToIndex:object.length - 8];
            [levelThreeFinal addObject:theTemp];
            
            
        }
        levelThreeDict = [NSDictionary dictionaryWithObject:levelThreeFinal forKey:@"Levels"];
        
        if (([object rangeOfString:@"level 4"].location != NSNotFound) && (![levelFour containsObject:object]))
        {
            
         //  NSLog(@"%@", object);
            [levelFour addObject:object];
            NSString *theTemp = [object substringToIndex:object.length - 8];
            [levelFourFinal addObject:theTemp];
            
        }
        levelFourDict = [NSDictionary dictionaryWithObject:levelFourFinal forKey:@"Levels"];
        
        if (([object rangeOfString:@"level 5"].location != NSNotFound) && (![levelFive containsObject:object]))
        {
        //    NSLog(@"%@", object);
            [levelFive addObject:object];
            NSString *theTemp = [object substringToIndex:object.length - 8];
            [levelFiveFinal addObject:theTemp];
            
        }
        levelFiveDict = [NSDictionary dictionaryWithObject:levelFiveFinal forKey:@"Levels"];
        
        if (([object rangeOfString:@"level 6"].location != NSNotFound) && (![levelSix containsObject:object]))
        {
         //   NSLog(@"%@", object);
            [levelSix addObject:object];
            NSString *theTemp = [object substringToIndex:object.length - 8];
            [levelSixFinal addObject:theTemp];
            
        }
        levelSixDict = [NSDictionary dictionaryWithObject:levelSixFinal forKey:@"Levels"];
    }
    // NSLog(@"%@", levelFiveDict);
    
    allLevels = [[NSMutableArray alloc] initWithObjects:levelThreeDict, levelFourDict, levelFiveDict, levelSixDict, nil];
    
    
    [myTableView reloadData];

    
//    for (id object in allCompletedTopics) {
//        if (([object rangeOfString:@"level 3"].location != NSNotFound) && (![levelThree containsObject:object]))
//        {
//            
//            [levelThree addObject:object];
//        }
//        levelThreeDict = [NSDictionary dictionaryWithObject:levelThree forKey:@"Levels"];
//        
//        if (([object rangeOfString:@"level 4"].location != NSNotFound) && (![levelFour containsObject:object]))
//        {
//            [levelFour addObject:object];
//        }
//        levelFourDict = [NSDictionary dictionaryWithObject:levelFour forKey:@"Levels"];
//        
//        if (([object rangeOfString:@"level 5"].location != NSNotFound) && (![levelFive containsObject:object]))
//        {
//            [levelFive addObject:object];
//        }
//        levelFiveDict = [NSDictionary dictionaryWithObject:levelFive forKey:@"Levels"];
//        
//        if (([object rangeOfString:@"level 6"].location != NSNotFound) && (![levelSix containsObject:object]))
//        {
//            [levelSix addObject:object];
//        }
//        levelSixDict = [NSDictionary dictionaryWithObject:levelSix forKey:@"Levels"];
//    }
//   // NSLog(@"%@", levelFiveDict);
//    
//    allLevels = [[NSMutableArray alloc] initWithObjects:levelThreeDict, levelFourDict, levelFiveDict, levelSixDict, nil];

}

-(void)updateTheProgressView
{
    [self creatingTheData];
    
    float temporary = theFinalScore;
    overallProgress.progress = temporary / 192;
   // NSLog(@"%f", overallProgress.progress);
    
    float theFloatThree = levelThree.count;
    float theFloatFour = levelFour.count;
    float theFloatFive = levelFive.count;
    float theFloatSix = levelSix.count;
    
//    NSLog(@"Completed level 3 is %.3f percent", theFloatThree*100);
    
    levelThreeProgress.progress = theFloatThree / 48;
    levelFourProgress.progress = theFloatFour / 48;
    levelFiveProgress.progress = theFloatFive / 48;
    levelSixProgress.progress = theFloatSix / 48;
    
    three.text = [NSString stringWithFormat:@"%.1f %%", theFloatThree/48 * 100];
    four.text = [NSString stringWithFormat:@"%.1f %%", theFloatFour/48 * 100];
    five.text = [NSString stringWithFormat:@"%.1f %%", theFloatFive/48 * 100];
    six.text = [NSString stringWithFormat:@"%.1f %%", theFloatSix/48 * 100];
    overall.text = [NSString stringWithFormat:@"%.1f %%", temporary/192 * 100];
    
    
    
//    NSLog(@"%.4f, %.4f, %.4f, %.4f", levelThreeProgress.progress, levelFourProgress.progress, levelFiveProgress.progress, levelSixProgress.progress);
    
    if (theFloatThree >= 16) {
        finalOverallLevel.text = @"3b";
    }
    if (theFloatThree >= 32) {
        finalOverallLevel.text = @"3a";
       
    }
    if (theFloatThree >= 40) {
        if (theFloatFour >= 8) {
            finalOverallLevel.text = @"4c";
        }
        if (theFloatFour >= 16) {
            finalOverallLevel.text = @"4b";
        }
        if (theFloatFour >= 32) {
            finalOverallLevel.text = @"4a";
        }
        if (theFloatFour >= 40) {
            if (theFloatFive >= 8) {
                finalOverallLevel.text = @"5c";
            }
            if (theFloatFive >= 16) {
                finalOverallLevel.text = @"5b";
            }
            if (theFloatFive >= 32) {
                finalOverallLevel.text = @"5a";
            }
            if (theFloatFive >= 40) {
                if (theFloatSix >= 8) {
                    finalOverallLevel.text = @"6c";
                }
                if (theFloatSix >= 16) {
                    finalOverallLevel.text = @"6b";
                }
                if (theFloatSix >= 32) {
                    finalOverallLevel.text = @"6a";
                }
            }
        }
    }
    self.title = [NSString stringWithFormat:@"Level %@", finalOverallLevel.text];
    [myTableView reloadData];
}


-(void)viewDidAppear:(BOOL)animated
{
  //  [self creatingTheData];
    
//    levelThreeFinal = [[NSMutableArray alloc] initWithCapacity:48];
//    levelFourFinal = [[NSMutableArray alloc] initWithCapacity:48];
//    levelFiveFinal = [[NSMutableArray alloc] initWithCapacity:48];
//    levelSixFinal = [[NSMutableArray alloc] initWithCapacity:48];
//    
//    for (NSString *object in levelThree) {
//        NSString *theTemp = [object substringToIndex:object.length - 8];
//        [levelThreeFinal addObject:theTemp];
//        //NSLog(@"%@", levelThreeFinal);
//    }
//    
//    for (NSString *object in allCompletedTopics) {
//        if (([object rangeOfString:@"level 3"].location != NSNotFound) && (![levelThree containsObject:object]))
//        {
//            
//            [levelThree addObject:object];
//            NSString *theTemp = [object substringToIndex:object.length - 8];
//            [levelThreeFinal addObject:theTemp];
//
//            
//        }
//        levelThreeDict = [NSDictionary dictionaryWithObject:levelThreeFinal forKey:@"Levels"];
//        
//        if (([object rangeOfString:@"level 4"].location != NSNotFound) && (![levelFour containsObject:object]))
//        {
//            [levelFour addObject:object];
//            NSString *theTemp = [object substringToIndex:object.length - 8];
//            [levelFourFinal addObject:theTemp];
//
//        }
//        levelFourDict = [NSDictionary dictionaryWithObject:levelFourFinal forKey:@"Levels"];
//        
//        if (([object rangeOfString:@"level 5"].location != NSNotFound) && (![levelFive containsObject:object]))
//        {
//            [levelFive addObject:object];
//            NSString *theTemp = [object substringToIndex:object.length - 8];
//            [levelFiveFinal addObject:theTemp];
//
//        }
//        levelFiveDict = [NSDictionary dictionaryWithObject:levelFiveFinal forKey:@"Levels"];
//        
//        if (([object rangeOfString:@"level 6"].location != NSNotFound) && (![levelSix containsObject:object]))
//        {
//            [levelSix addObject:object];
//            NSString *theTemp = [object substringToIndex:object.length - 8];
//            [levelSixFinal addObject:theTemp];
//
//        }
//        levelSixDict = [NSDictionary dictionaryWithObject:levelSixFinal forKey:@"Levels"];
//    }
//    // NSLog(@"%@", levelFiveDict);
//    
//    allLevels = [[NSMutableArray alloc] initWithObjects:levelThreeDict, levelFourDict, levelFiveDict, levelSixDict, nil];
//
//    
    [myTableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[allLevels objectAtIndex:section] objectForKey:@"Levels"] count];
    //return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return allLevels.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    
  //  cell.textLabel.text = [allCompletedTopics objectAtIndex:indexPath.row];
    
   NSDictionary *dictionary = [allLevels objectAtIndex:indexPath.section];
   NSArray *array = [dictionary objectForKey:@"Levels"];
   NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSString *theTitle = [[NSString alloc] init];
    
    switch (section) {
        case 0:
            theTitle = @"Level 3";
            break;
        case 1:
            theTitle = @"Level 4";
            break;
        case 2:
            theTitle = @"Level 5";
            break;
        case 3:
            theTitle = @"Level 6";
            break;
        default:
            break;
    }
    return theTitle;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSString *theCompletedViewController = [theDictionary objectForKey:<#(id)#>];
   // NSLog(@"%@", tableView);
   // NSLog(@"%@", [theDictionary allKeysForObject:indexPath]);
    
}


- (void)viewDidUnload
{
    [self setLevelSixProgress:nil];
    [self setLevelFiveProgress:nil];
    [self setLevelFourProgress:nil];
    [self setLevelThreeProgress:nil];
    [self setFinalOverallLevel:nil];
    [self setThree:nil];
    [self setFour:nil];
    [self setFive:nil];
    [self setSix:nil];
    [self setOverall:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
