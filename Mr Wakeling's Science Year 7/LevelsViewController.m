//
//  LevelsViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 27/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LevelsViewController.h"
#import "LevelsModel.h"

@interface LevelsViewController ()

@end

@implementation LevelsViewController
/*
@synthesize levels;
@synthesize levelDescriptors;
@synthesize levelDict;
@synthesize secondTemp;
*/
@synthesize unitToSubUnit;
@synthesize levelModel;
@synthesize subUnitToLevel;
@synthesize secondSubUnitToLevel;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    levelModel = [[LevelsModel alloc] init];
    
    /*
    
    NSDictionary *temp = [levelDict objectForKey:subUnitToLevel];
    NSArray *tempArray = [temp allKeys];
    
    levels = [tempArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    */
    
    self.title = secondSubUnitToLevel;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    [levelModel getTheLevels:unitToSubUnit :subUnitToLevel];
    
    return levelModel.levelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [levelModel.levelArray objectAtIndex:indexPath.row];
   
   // NSDictionary *temp = [levelDict objectForKey:subUnitToLevel];
  //  secondTemp = [temp objectForKey:[levels objectAtIndex:indexPath.row]];

    [levelModel getTheDescriptors:unitToSubUnit :subUnitToLevel];
    
    cell.detailTextLabel.text = [[levelModel.levelDescriptorsFinal objectForKey:[levelModel.levelArray objectAtIndex:indexPath.row]] objectForKey:@"Descriptor"];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:45];
    cell.detailTextLabel.font = [UIFont fontWithName:@"Copperplate" size:30];
    cell.detailTextLabel.numberOfLines = 0;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 960/[levelModel.levelArray count];
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSDictionary *temp = [levelDict objectForKey:subUnitToLevel];
  //  secondTemp = [temp objectForKey:[levels objectAtIndex:indexPath.row]];

    NSString *newViewController = [[levelModel.levelDescriptorsFinal objectForKey:[levelModel.levelArray objectAtIndex:indexPath.row]] objectForKey:@"View Controller"];
    
   /* if ([secondSubUnitToLevel isEqualToString:@"The Solar System"]) {
        NSLog(@"hello");
        PlanetaryOrderViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:newViewController];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
    else {
        
    */
    TextfieldCheckerViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:newViewController];
    
//    MicroscopeViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:newViewController];

    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
//}
}

@end
