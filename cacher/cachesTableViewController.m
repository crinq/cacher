//
//  cachesTableViewController.m
//  cacher
//
//  Created by crinq on 10.08.12.
//  Copyright (c) 2012 crinq. All rights reserved.
//

#import "cachesTableViewController.h"

@interface cachesTableViewController ()

@end

@implementation cachesTableViewController

- (id)init
{

    self = [super init];
    if (self) {
        // Custom initialization
        [self setTitle:@"Caches"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"sort" style:UIBarButtonSystemItemDone target:self action:@selector(sort)];
    self.navigationItem.rightBarButtonItem = rightButton;
}

- (void)sort{
    sorted = YES;
    [self updateView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return [[[[AppDelegate sharedSingleton] rootControllerSwitch] caches] count];
    return [[[[root get] rootControllerSwitch] cachesSorted] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    }
    // Configure the cell...
    //cell.textLabel.text = @"test";
    //cell.detailTextLabel.text = @"test detail";
    NSArray *caches;
    
    //if(sorted){
        caches = [[[root get] rootControllerSwitch] cachesSorted];
    //}
    //else{
        //caches = [[[root get] rootControllerSwitch] caches];
    //}
        
    pos *currentpos = [[[root get] rootControllerSwitch] currentPosition];
    cache * currentCache = [caches objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [currentCache GCName];
    
    if([currentpos distanceTo:[currentCache GCPos]] > 1000.0){
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%.2fKm %.1f/%.1f %@ %@", [currentpos distanceTo:[currentCache GCPos]] / 1000.0, [currentCache D], [currentCache T], [currentCache GCSize], [currentCache GCType]];
    }
    else{
        cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%.0fm %.1f/%.1f %@ %@", [currentpos distanceTo:[currentCache GCPos]], [currentCache D], [currentCache T], [currentCache GCSize], [currentCache GCType]];
    }
//    cell.detailTextLabel.text = [[NSString alloc] initWithFormat:@"%.1fm %.1f/%.1f %@ %@", [currentpos distanceTo:[currentCache GCPos]], [currentCache D], [currentCache T], [currentCache GCSize], [currentCache GCType]];
    
    return cell;
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
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    cacheDetails = [[cacheDetailsViewController alloc] initWithGCCode:[[[[[root get] rootControllerSwitch] cachesSorted] objectAtIndex:indexPath.row] GCCode]];
    [[self navigationController] pushViewController:cacheDetails animated:YES];
}

- (void)updateView
{
    if([self isViewLoaded] && self.view.window){
        [self.tableView reloadData];
        [cacheDetails updateView];
    }
}

@end
