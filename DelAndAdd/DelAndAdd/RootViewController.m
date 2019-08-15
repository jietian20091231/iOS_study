//
//  RootViewController.m
//  DelAndAdd
//
//  Created by Jie on 2019/8/15.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"

#define CellIdentifier @"CellIdentifier"

@interface RootViewController () <UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray * presidentsList;
@property (nonatomic, strong) NSMutableArray * showPresidentsList;
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UITextField * textField;
@property BOOL isEditing;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSLog(@"RootViewController:viewDidLoad");
    CGRect screen = [UIScreen mainScreen].bounds;
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"presidents" ofType:@"plist"];
    _presidentsList = [[NSArray alloc] initWithContentsOfFile:plistPath];
    _showPresidentsList = [[NSMutableArray alloc] initWithArray:_presidentsList];
    
    //NSLog(@"_showPresidentsList[0] type is %@", _showPresidentsList[0]);
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"Presidents";
    
    CGFloat tableY = 64;
    CGFloat tableH = screen.size.height - tableY;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tableY, screen.size.width, tableH) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _isEditing = NO;
    
    [self.view addSubview: _tableView];
    
    _textField = [[UITextField alloc] init];
    _textField.placeholder = @"Add...";
    _textField.borderStyle = UITextBorderStyleNone;
    _textField.text = @"";
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField.keyboardType = UIKeyboardTypeDefault;
    _textField.returnKeyType = UIReturnKeyDone;
    
    _textField.hidden = YES;
    _textField.delegate = self;
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
//    NSLog(@"editing %@", (editing)? @"YES": @"NO");
//    NSLog(@"_isEditing %@", (_isEditing)? @"YES": @"NO");
//    NSLog(@"!_isEditing %@", (!_isEditing)? @"YES": @"NO");
    _isEditing = !_isEditing;
    _textField.hidden = !editing;
    [_tableView setEditing:_isEditing animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    //NSLog(@"row = %li", row);
    if (row < [_showPresidentsList count]) {
        return UITableViewCellEditingStyleDelete;
    } else {
        _textField.hidden = NO;
        return UITableViewCellEditingStyleInsert;
    }
    
    return UITableViewCellEditingStyleNone;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"RootViewController:numberOfRowsInSection count = %li", [_showPresidentsList count]);
    return [_showPresidentsList count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier: CellIdentifier];
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//  NSLog(@"RootViewController:cellForRowAtIndexPath _showPresidentsList count = %li", _showPresidentsList.count);
    NSUInteger row = [indexPath row];
//  NSLog(@"RootViewController:cellForRowAtIndexPath row = %li", row );
    if (row < [_showPresidentsList count]) {
        cell.textLabel.text = _showPresidentsList[row][@"name"];
//       NSLog(@"RootViewController:cellForRowAtIndexPath row = %li, name = %@", row ,_showPresidentsList[row][@"name"]);
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (row == [_showPresidentsList count]) {
        cell.textLabel.text = @"";
        _textField.frame = CGRectMake(55, 0 , cell.frame.size.width - 55, cell.frame.size.height);
        [cell addSubview:_textField];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}


#pragma mark

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    //NSLog( @"textField.txt = %@ ", textField.text );
    [_textField resignFirstResponder];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //NSLog(@"RootViewController:shouldChangeCharactersInRange => string = %@", string);
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"RootViewController:commitEditingStyle indexPath section %li, row %li", [indexPath section], [indexPath row]);
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSMutableArray *tmp = [[NSMutableArray alloc] initWithArray:_showPresidentsList];
        [tmp removeObjectAtIndex:[indexPath row]];
        [_showPresidentsList removeAllObjects];
        NSLog(@"_showPresidentsList count = %li", [_showPresidentsList count]);
        [_showPresidentsList addObjectsFromArray:tmp];
        NSLog(@"tmp count = %li", [tmp count]);
        NSLog(@"_showPresidentsList count = %li", [_showPresidentsList count]);
        [tableView reloadData];
        
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        NSLog(@"RootViewController:UITableViewCellEditingStyleInsert");
        NSLog(@"_textField text : %@ , length: %li", [_textField text], [_textField text].length);
        if ([_textField text].length > 0) {
            
            NSDictionary *newRow = [NSDictionary dictionaryWithObject:_textField.text forKey:@"name"];
            NSMutableArray *tmp = [[NSMutableArray alloc] initWithArray: _showPresidentsList];
            [tmp addObject:newRow];
            [_showPresidentsList removeAllObjects];
            [_showPresidentsList addObjectsFromArray:tmp];
            NSLog(@"_showPresidentsList count : %li", [_showPresidentsList count]);
            [_tableView reloadData];
            
            _textField.text = @"";
            _textField.hidden = YES;
        }
        
    }
}

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
