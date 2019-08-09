//
//  RootViewController.m
//  SampleTable
//
//  Created by Jie on 2019/8/9.
//  Copyright © 2019 jie. All rights reserved.
//

#import "RootViewController.h"

#define CellIdentifier @"CellIdentifier"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray * listTeams;
@property (nonatomic, strong) UITableView * tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"team" ofType:@"plist"];
    _listTeams = [[NSArray alloc] initWithContentsOfFile: plistPath];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

#pragma mark

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"_listTeams count = %li", [_listTeams count] );
    return [_listTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier: CellIdentifier ];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault  reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowDict = _listTeams[row];
    NSLog(@"rowDict = %@", rowDict);
    cell.textLabel.text = rowDict[@"name"];
    NSString *imagePath = [[NSString alloc] initWithFormat: @"%@.png", rowDict[@"image"]];
    cell.imageView.image = [UIImage imageNamed:imagePath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
