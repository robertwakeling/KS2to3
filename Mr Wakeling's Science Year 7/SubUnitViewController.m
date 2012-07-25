//
//  SubUnitViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 27/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SubUnitViewController.h"
#import "SubUnitModel.h"

@interface SubUnitViewController ()

@end

@implementation SubUnitViewController
/*
@synthesize subDict;
@synthesize scienceUnits;
@synthesize subUnits;
*/
@synthesize sUnitModel;
@synthesize unitToSubUnit;

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
   
    sUnitModel = [[SubUnitModel alloc] init];
    
   /*
    subDict = [scienceUnits objectForKey:unitToSubUnit];
    
    NSDictionary *temp = [subDict objectForKey:@"SubUnits"];
    
    NSArray *tempArray = [temp allKeys];
    
    subUnits = [tempArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    */
    
    self.title = unitToSubUnit;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    [sUnitModel getTheSubUnitArray:unitToSubUnit];
    
    return sUnitModel.subUnitArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
   
    cell.textLabel.text = [[sUnitModel.subUnitArray objectAtIndex:indexPath.row] substringFromIndex:2];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:30];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 960/[sUnitModel.subUnitArray count];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    LevelsViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Levels"];
     // ...
     // Pass the selected object to the new view controller.
    detailViewController.subUnitToLevel = [NSString stringWithFormat:@"%@", [sUnitModel.subUnitArray objectAtIndex:indexPath.row]];
    detailViewController.unitToSubUnit = unitToSubUnit;
    
    detailViewController.secondSubUnitToLevel = [NSString stringWithFormat:@"%@", [[sUnitModel.subUnitArray objectAtIndex:indexPath.row] substringFromIndex:2]];

  //  detailViewController.levelDict = [subDict objectForKey:@"SubUnits"];
    
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end
