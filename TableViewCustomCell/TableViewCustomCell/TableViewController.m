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

@interface TableViewController ()
@property (nonatomic, strong) NSArray * teamsList;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource: @"team" ofType:@"plist"];
    _teamsList = [[NSArray alloc] initWithContentsOfFile:plistPath];
    NSLog(@"_teamList = %li", [_teamsList count]);
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_teamsList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    NSUInteger row = [indexPath row];
    
    NSDictionary *rowDict = _teamsList[row];
    cell.myLabel.text = rowDict[@"name"];
    
    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.png", rowDict[@"image"]];
    cell.myImageView.image = [UIImage imageNamed:imagePath];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
