//
//  TableViewController.m
//  TableViewCustomCell
//
//  Created by Jie on 2019/8/10.
//  Copyright © 2019 jie. All rights reserved.
//


#import "TableViewController.h"
#import "CustomTableViewCell.h"

#define CellIdentifier @"CellIdentifier"

@interface TableViewController () <UISearchBarDelegate, UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController * searchController;

@property (nonatomic, strong) NSArray * teamsList;
@property (nonatomic, strong) NSMutableArray * listFilterTeams;
@property CGFloat rowHeight;

@end

@implementation TableViewController

- (void)viewDidLoad {
    NSLog(@"TableViewController:viewDidLoad");
    [super viewDidLoad];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource: @"team" ofType:@"plist"];
    _teamsList = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSLog(@"_teamList = %li", [_teamsList count]);
    _listFilterTeams = [NSMutableArray arrayWithArray: _teamsList];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _rowHeight = 70;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.searchBar.delegate = self;
    
    self.tableView.tableHeaderView = _searchController.searchBar;
    [_searchController.searchBar sizeToFit];
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"TableViewController:numberOfRowsInSection");
    return [_listFilterTeams count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [[CustomTableViewCell alloc] initWithMyStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier rowHeight: _rowHeight];
    NSUInteger row = [indexPath row];
    
    if ( [_listFilterTeams count] > 0 ) {
        NSDictionary *rowDict = _listFilterTeams[row];
        cell.myLabel.text = rowDict[@"name"];
        
        cell.mySubLabel.text = rowDict[@"image"];
        
        NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.png", rowDict[@"image"]];
        cell.myImageView.image = [UIImage imageNamed:imagePath];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.rowHeight;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"TableViewController:searchBarCancelButtonClicked");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"TableViewController:searchBarSearchButtonClicked");
    NSString *searchText = _searchController.searchBar.text;
    NSLog(@"serachText = %@", searchText);
    if ([searchText length] == 0) {
        _listFilterTeams = [NSMutableArray arrayWithArray: _teamsList];
        return;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"image CONTAINS[c] %@", searchText];
    NSArray *tempArray = [_teamsList filteredArrayUsingPredicate: predicate];
    _listFilterTeams = [NSMutableArray arrayWithArray: tempArray];
    [self.tableView reloadData];
    
    
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"TableViewController:updateSearchResultsForSearchController");
    _listFilterTeams = [NSMutableArray arrayWithArray: _teamsList];
    [self.tableView reloadData];
}

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
