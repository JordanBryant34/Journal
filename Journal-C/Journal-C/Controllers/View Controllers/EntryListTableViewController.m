//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by Jordan Bryant on 9/28/20.
//  Copyright © 2020 Jordan Bryant. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[EntryController sharedInstance] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"entryCellId"];
    Entry *entry = [[[EntryController sharedInstance] entries] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = entry.title;
    cell.detailTextLabel.text = entry.body;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Entry *entry = EntryController.sharedInstance.entries[indexPath.row];
        [EntryController.sharedInstance removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"toDetailVC"]) {
        EntryDetailViewController *detailVC = segue.destinationViewController;
        NSIndexPath *selectedIndex = self.tableView.indexPathForSelectedRow;
        Entry *entry = [[[EntryController sharedInstance] entries] objectAtIndex:selectedIndex.row];
        
        detailVC.entry = entry;
    }
}

@end
