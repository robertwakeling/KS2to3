//
//  UnitViewController.m
//  Mr Wakeling's Science Year 7
//
//  Created by robert wakeling on 27/03/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UnitViewController.h"
#import "SubUnitViewController.h"
#import "units.h"
#import "Tester.h"

@interface UnitViewController ()

@end

@implementation UnitViewController
//@synthesize unitsArray, unitTitles, scienceUnitsDict;

@synthesize unitModel;

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

    unitModel = [[units alloc] init];
    
    /*
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"plist"];
    scienceUnitsDict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    
    unitArray = [[scienceUnitsDict allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    */
     
    self.title = @"Mr Wakeling's Science - Year 7";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    }

-(IBAction)viewOverallLevel
{
    Tester *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Overall1"];
    
    [self.navigationController pushViewController:detail animated:YES];
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
    [unitModel getTheArray];
    
    return unitModel.unitArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
     // Configure the cell...
    
    
    cell.textLabel.text = [unitModel.unitArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"Chalkduster" size:30];

    cell.detailTextLabel.text = [[unitModel.theDictionary valueForKey:[unitModel.unitArray objectAtIndex:indexPath.row]] valueForKey:@"Title"];

    cell.detailTextLabel.font = [UIFont fontWithName:@"Copperplate" size:18];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 960/[unitModel.unitArray count];
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
    SubUnitViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SubUnitDetail"];

    detailViewController.unitToSubUnit = [NSString stringWithFormat:@"%@",[unitModel.unitArray objectAtIndex:indexPath.row]];
  //  detailViewController.scienceUnits = scienceUnitsDict;
    [self.navigationController pushViewController:detailViewController animated:YES];

}

@end
